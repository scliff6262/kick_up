class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :level, :zip_code, :email
  has_many :rsvps
end
