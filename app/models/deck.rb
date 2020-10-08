class Deck < ApplicationRecord

  has_many :cards
  has_many :fav_decks
  has_many :users, through: :fav_decks

  def create_cards(params)
    length = params[:length].to_i
    num = 0
    while num < length do
      Card.create(front: params["card#{num}"][:front], back: params["card#{num}"][:back], deck_id: self.id)
      num += 1
    end
  end


  
end
