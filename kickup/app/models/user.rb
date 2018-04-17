class User < ActiveRecord::Base
  has_secure_password

  has_many :rsvps
  has_many :events, through: :rsvps

  def organized_events
    Event.where(organizer_id: self.id)
  end
end
