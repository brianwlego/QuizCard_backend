class Quiz < ApplicationRecord

  has_many :questions
  has_many :fav_quizzes
  has_many :users, through: :fav_quizzes

end
