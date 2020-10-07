class Deck < ApplicationRecord

  has_many :cards
  has_many :fav_decks
  has_many :users, through: :fav_decks


end
