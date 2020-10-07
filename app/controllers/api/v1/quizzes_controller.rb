class Api::V1::QuizzesController < ApplicationController

  def index
    quizzes = Quiz.all 
  end

  def show
    quiz = Quiz.find(params[:id])
    render json: { quiz: QuizSerializer.new(quiz) }
  end

  def create

  end

  def update

  end

  def destroy

  end


  private

  def quiz_params
    params.require(:quiz).permit(:category, :title, :img_url)
  end

end
