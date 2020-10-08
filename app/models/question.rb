class Question < ApplicationRecord

  belongs_to :quiz
  has_many :choices

  has_one_attached :picture

end
