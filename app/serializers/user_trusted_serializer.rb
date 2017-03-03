class UserTrustedSerializer < ActiveModel::Serializer
  attributes :username, :fullname, :photo_url, :email, :token
end
