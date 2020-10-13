class User < ApplicationRecord
  has_secure_password

  has_many :fav_quizs
  has_many :fav_decks
  has_many :quizzes, through: :fav_quizs
  has_many :decks, through: :fav_decks

  has_one_attached :profile_picture


  def fetch_decks
    decks = Deck.all
    decks_array = decks.map{|deck| DeckSerializer.new(deck)}
    return decks_array
  end

  def fetch_quizzes
    quizzes = Quiz.all
    quizzes_array = quizzes.map{|quiz| QuizSerializer.new(quiz)}
    return quizzes_array
  end

  def user_creations
    quizzes = Quiz.where(user_created_id: self.id)
    quizzes_array = quizzes.map{|quiz| QuizSerializer.new(quiz)}
    decks = Deck.where(user_created_id: self.id)
    decks_array = decks.map{|deck| DeckSerializer.new(deck)}
    combined_array = quizzes_array + decks_array
    return combined_array
  end

  def user_favs
    quizzes = self.quizzes
    decks = self.decks
    combined_array = quizzes + decks
    return combined_array
  end


end
