class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :users, through: :rsvps

  def organizer
    User.find(self.organizer_id)
  end 
end
