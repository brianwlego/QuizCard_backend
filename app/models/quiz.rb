class Quiz < ApplicationRecord

  has_many :questions, dependent: :delete_all
  has_many :fav_quizzes, dependent: :delete_all
  has_many :users, through: :fav_quizzes
  has_many :scores, dependent: :delete_all

  has_one_attached :profile_picture

end
