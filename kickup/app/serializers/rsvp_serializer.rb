class RsvpSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user, serializer: RsvpUserSerializer
end
