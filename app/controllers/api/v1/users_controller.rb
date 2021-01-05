class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :home, :wakeup]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def wakeup
    render json: { msg: "QuizCard-backend, I'm awake!" }
  end

  def populate
    decks_and_quizzes_array = current_user.user_creations
    favs_array = current_user.user_favs
    scores_array = current_user.user_scores
    render json:  {decks_quizzes: decks_and_quizzes_array, user_favs: favs_array, scores: scores_array}, status: :accepted
  end

  def home 
    quizzes = Quiz.select(:id, :category, :title)
    decks = Deck.select(:id, :category, :title)
    render json: { quizzes: quizzes, decks: decks}
  end

  def create
    user = User.create(user_params)
    if params[:profile_picture] != ''
      user.save_image(params[:profile_picture], user)
    end
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end
