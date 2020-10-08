class Api::V1::DecksController < ApplicationController


  def show
    deck = Deck.find(params[:id])
    render json: { deck: DeckSerializer.new(deck) }, status: :accepted
  end

  def create
    deck = Deck.create(deck_params)
    deck.user_created_id = current_user.id
    if deck.valid?
      deck.create_cards(params)
      render json: { deck: DeckSerializer.new(deck) }, status: :accepted
    else
      render json: { error: "Failed to create Deck."}, status: :not_acceptable
    end
  end

  def update

  end

  def destroy

  end


  private

  def deck_params
    params.require(:deck).permit(:category, :title)
  end

end
