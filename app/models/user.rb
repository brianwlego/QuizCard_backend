class User < ApplicationRecord
  has_secure_password

  has_many :fav_quizs
  has_many :fav_decks
  has_many :quizzes, through: :fav_quizs
  has_many :decks, through: :fav_decks
  has_many :scores

  validates :email, :first_name, :last_name, :password, presence: true
  validates :email, uniqueness: true



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
    quizzes_array = quizzes.map{|quiz| QuizSerializer.new(quiz)}
    decks = self.decks
    decks_array = decks.map{|deck| DeckSerializer.new(deck)}
    combined_array = quizzes_array + decks_array
    return combined_array
  end

  def user_scores
    scores_array = self.scores.map{|score| ScoreSerializer.new(score)}
    return scores_array
  end


  def save_image(image, user)
    name = File.basename(image)
    obj = S3_BUCKET.object(name)
    obj.upload_file(image)
    user.img_url = obj.public_url.to_s
    user.save
  end


end
