class Api::V1::QuizzesController < ApplicationController

  def index
    quizzes = Quiz.all 
  end

  def show
    quiz = Quiz.find(params[:id])
    render json: { quiz: QuizSerializer.new(quiz) }
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

  end


  private

  def quiz_params
    params.require(:quiz).permit(:category, :title)
  end

end
