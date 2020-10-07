class FavQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
end
