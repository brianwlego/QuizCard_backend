class QuizSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :img_url
  has_many :questions
  has_many :choices, through: :questions

end
