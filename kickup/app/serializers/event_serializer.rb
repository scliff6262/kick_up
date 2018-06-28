class EventSerializer < ActiveModel::Serializer
  has_many :users
  has_many :rsvps
  attributes :id, :title, :date, :event_time
end
