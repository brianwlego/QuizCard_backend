class Api::V1::CardsController < ApplicationController

  def create
    cards = params[:cards].map{|card| Card.create(front: card[:front], back: card[:back], deck_id: card[:deck_id])}
    deck = Deck.find(params[:deck_id])
    render json: { deck: DeckSerializer.new(deck) }, status: :accepted
  end


end