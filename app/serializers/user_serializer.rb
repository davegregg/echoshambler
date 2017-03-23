class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :photo_url, :creepers_count, :creepees_count, :created_at
  has_many :grunts
end
