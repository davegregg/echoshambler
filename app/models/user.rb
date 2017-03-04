require 'uri'

class User < ApplicationRecord
  has_many :grunts
  validates :username,  presence: true,
                        uniqueness: true
  validates :email,     presence: true,
                        uniqueness: true
  validates :photo_url, required: false
  validates :photo_url, format: { with: URI.regexp },
                        if: 'photo_url.present?'
  has_secure_password
  has_secure_token
  # acts_as_follower
  # acts_as_followable
end
