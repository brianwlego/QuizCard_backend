class Deck < ApplicationRecord

  has_many :cards, :dependent => :delete_all
  has_many :fav_decks, :dependent => :delete_all
  has_many :users, through: :fav_decks


end
