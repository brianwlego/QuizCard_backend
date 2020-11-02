class Api::V1::DecksController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    paginate Deck.unscoped, per_page: 30
  end

  def show
    deck = Deck.find(params[:id])
    if current_user
      fav_deck = FavDeck.find_by(user_id: current_user.id, deck_id: deck.id)
    end
    render json: { deck: DeckSerializer.new(deck), fav_deck: fav_deck }, status: :accepted
  end

  def create
    deck = Deck.create(deck_params)
    if params[:img] != ''
      deck.save_image(params[:img], deck)
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
    deck = Deck.find(params[:id])
    deck.update(deck_params)
    if params[:newimg] != ''
      deck.save_image(params[:newimg], deck)
    end

    if deck.valid?
      render json: { deck: DeckSerializer.new(deck) }, status: :accepted
    else
      render json: { error: "Failed to update deck" }, status: :not_acceptable
    end
  end

  def destroy
    deck = Deck.find(params[:id])
    deck.destroy
    if !deck.save
      render json: { success: "Deck deleted" }, status: :accepted
    else
      render json: { error: "Failed to delete deck"}, status: :not_acceptable
    end
  end

  def favorite
    fav_deck = FavDeck.create(deck_id: params[:deck_id], user_id: current_user.id)
    if fav_deck.valid?
      render json: { fav_deck: fav_deck }, status: :accepted
    else
      render json: { error: "Failed to favorite deck" }, status: :not_acceptable
    end
  end

  def unfavorite
    fav_deck = FavDeck.find_by(user_id: current_user.id, deck_id: params[:deck_id])
    fav_deck.destroy
    if !fav_deck.save
      render json: { success: "Deleted fav_deck"}, status: :accepted
    else
      render json: { error: "Failed to unfavorite deck"}, status: :not_acceptable
    end
  end


  private

  def deck_params
    params.require(:deck).permit(:category, :title)
  end

end
