class UserSerializer < ActiveModel::Serializer
  attributes :username, :fullname, :photo_url
  has_many :grunts
end
