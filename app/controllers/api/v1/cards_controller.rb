class Api::V1::CardsController < ApplicationController

  def create
    card = Card.create(card_params)
    if card.valid?
      render json: { card: CardSerializer.new(card) }, status: :accepted
    else
      render json: { error: "Failed to create card" }, status: :not_acceptable
    end
  end

  def update
    card = Card.find(params[:id])
    card.update(card_params)
    if card.valid?
      render json: { card: CardSerializer.new(card) }, status: :accepted
    else
      render json: { error: "Failed to update Card" }, status: :not_acceptable
    end
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy 
    if !card.save
      render json: { success: "Card successfully deleted" }, status: :accepted
    else
      render json: { error: "Failed to delete Card" }, status: :not_acceptable
    end
  end

  

  private 

  def card_params
    params.require(:card).permit(:front, :back, :deck_id)
  end


end