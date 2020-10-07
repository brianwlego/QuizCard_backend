class User < ApplicationRecord
  has_secure_password

  has_many :fav_quizs
  has_many :fav_decks
  has_many :quizzes
  has_many :decks


end
