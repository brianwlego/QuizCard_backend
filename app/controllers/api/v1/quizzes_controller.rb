class Api::V1::QuizzesController < ApplicationController

  def index
    quizzes = Quiz.all 
  end

  def show
    quiz = Quiz.find(params[:id])
    fav_quiz = FavQuiz.find_by(user_id: current_user.id, quiz_id: quiz.id)
    render json: { quiz: QuizSerializer.new(quiz), fav_quiz: fav_quiz }
  end

  def create
    quiz = Quiz.create(quiz_params)
    if params[:img] != ''
      quiz.profile_picture.attach(params[:img])
      quiz.img_url = url_for(quiz.profile_picture)
    end
    quiz.user_created_id = current_user.id
    quiz.save
    if quiz.valid?
      render json: { quiz: QuizSerializer.new(quiz) }, status: :accepted
    else
      render json: { error: "Failed to create quiz."}, status: :not_acceptable
    end
  end

  def update

  end

  def destroy
    quiz = Quiz.find(params[:id])
    quiz.questions.each{|question| question.destroy}
    quiz.profile_picture.purge_later
    quiz.destroy
    if !quiz.save
      render json: { success: "Quiz deleted" }, status: :accepted
    else
      render json: { error: "Failed to delete quiz" }, status: :not_acceptable
    end
  end

  def favorite
    fav_quiz = FavQuiz.create(quiz_id: params[:quiz_id], user_id: current_user.id)
    if fav_quiz.valid?
      render json: { fav_quiz: fav_quiz }, status: :accepted
    else
      render json: { error: "Failed to favorite quiz" }, status: :not_acceptable
    end
  end

  def unfavorite
    fav_quiz = FavQuiz.find_by(user_id: current_user.id, quiz_id: params[:quiz_id])
    fav_quiz.destroy
    if !fav_quiz.save
      render json: { success: "Deleted fav_quiz"}, status: :accepted
    else
      render json: { error: "Failed to unfavorite quiz"}, status: :not_acceptable
    end
  end


  private

  def quiz_params
    params.require(:quiz).permit(:category, :title)
  end

end
