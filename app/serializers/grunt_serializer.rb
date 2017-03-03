class GruntSerializer < ActiveModel::Serializer
  attributes :body, :created_at, :updated_at
  has_one :user
end
