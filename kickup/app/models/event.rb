class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :event_type, presence: true
  validates :address, presence: true

  validates :zip_code, presence: true
  validates_format_of :zip_code, with: /\A\d{5}-\d{4}|\A\d{5}\z/

  validates :skill_level, presence: true

  validates :organizer_id, presence: true

  validates :time, presence: true

  has_many :rsvps
  has_many :users, through: :rsvps

  def organizer
    User.find(self.organizer_id)
  end
end
