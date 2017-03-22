require 'uri'

class User < ApplicationRecord
  has_many  :grunts, dependent: :restrict_with_error
  validates :username, :email, presence: true,
                               uniqueness: true,
                               length: {maximum: 255}
  validates :photo_url, required: false
  validates :photo_url, format: {with: URI.regexp},
                        allow_blank: true
  has_secure_password
  has_secure_token
  acts_as_creeper
  acts_as_creepable
end
