class DeckSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :img_url
  has_many :cards
end
