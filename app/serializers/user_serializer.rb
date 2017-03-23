class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :photo_url, :creepers_count, :creepees_count, :created_at, :grunts_count
  has_many :grunts
end
