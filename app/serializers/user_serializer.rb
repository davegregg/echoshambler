class UserSerializer < ActiveModel::Serializer
  attributes :username, :fullname, :photo_url, :creepers_count, :creepees_count
  has_many :grunts
end
