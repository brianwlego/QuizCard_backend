class DeckSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :img_url, :cards, :created_at, :updated_at, :made_by

  def made_by
    user = User.find(object.user_created_id)
    return user.first_name + " " + user.last_name
  end

  def cards
    object.cards.map{|card| {id: card.id, num: card.num, front: card.front, back: card.back, img_url_front: card.img_url_front, img_url_back: card.img_url_back}}
  end

end
