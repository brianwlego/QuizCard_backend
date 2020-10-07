class DeckSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :img_url
end
