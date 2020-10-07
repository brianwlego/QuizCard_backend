class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :email

  def name
    object.first_name + ' ' + object.last_name
  end

end
