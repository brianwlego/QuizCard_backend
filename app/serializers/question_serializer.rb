class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :img_url, :quiz_id, :choices

  def choices
    object.choices.map{|choice| {id: choice.id, content: choice.content, answer: choice.answer, question_id: choice.question_id}}
  end
end