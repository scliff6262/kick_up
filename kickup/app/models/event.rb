class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :event_type, presence: true
  validates :address, presence: true

  validates :zip_code, presence: true
  validates_format_of :zip_code, with: /\A\d{5}-\d{4}|\A\d{5}\z/

  validates :skill_level, presence: true

  validates :organizer_id, presence: true

  validates :event_time, presence: true
  validates_format_of :event_time, with: /\A\d{2}:\d{2}\z/

  validates :date, presence: true
  validates_format_of :date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"

  has_many :rsvps
  has_many :users, through: :rsvps

  def organizer
    User.find(self.organizer_id)
  end
end
