class Deck < ApplicationRecord

  has_many :cards, :dependent => :delete_all
  has_many :fav_decks, :dependent => :delete_all
  has_many :users, through: :fav_decks

  def save_image(image, deck)
    name = File.basename(image)
    obj = S3_BUCKET.object(name)
    obj.upload_file(image)
    deck.img_url = obj.public_url.to_s
    deck.save
  end


end
