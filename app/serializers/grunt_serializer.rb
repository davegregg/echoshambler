class GruntSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at
  has_one :user
end
