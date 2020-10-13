class Api::V1::DecksController < ApplicationController


  def show
    deck = Deck.find(params[:id])
    render json: { deck: DeckSerializer.new(deck) }, status: :accepted
  end

  def create
    deck = Deck.create(deck_params)
    if params[:img] != ''
      deck.profile_picture.attach(params[:img])
      deck.img_url = url_for(deck.profile_picture)
    end
    deck.user_created_id = current_user.id
    deck.save
    if deck.valid?
      render json: { deck: DeckSerializer.new(deck) }, status: :accepted
    else
      render json: { error: "Failed to create Deck."}, status: :not_acceptable
    end
  end

  def update

  end

  def destroy
    deck = Deck.find(params[:id])
    if deck.user_created_id == current_user.id
      deck.destroy
      render json: { success: "Deck deleted" }
    end
  end


  private

  def deck_params
    params.require(:deck).permit(:category, :title)
  end

end
