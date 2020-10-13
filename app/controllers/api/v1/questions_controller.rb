class Api::V1::QuestionsController < ApplicationController

  def create
    question = Question.create(question_params)
    if question.valid?
      render json: { question: QuestionSerializer.new(question) }, status: :accepted
    else
      render json: { error: "Failed to create new question." }, status: :not_acceptable
    end
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
    if question.valid?
      render json: { question: QuestionSerializer.new(question)}, status: :accepted
    else
      render json: { error: "Failed to update question." }, status: :not_acceptable
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    if !question.save
      render json: { success: "Deleted question" }, status: :accepted
    else
      render json: { error: "Failed to delete question." }, status: :not_acceptable
    end
  end


  private

  def question_params
    params.require(:question).permit(:content, :quiz_id, :id, choices_attributes: [
      :content, :answer, :id
    ])
  end


end