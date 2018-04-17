class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zip_code, presence: true
  validates_format_of :zip_code, with: /\A\d{5}-\d{4}|\A\d{5}\z/
  validates :phone, presence: true
  validates :level, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password

  has_many :rsvps
  has_many :events, through: :rsvps

  def organized_events
    Event.where(organizer_id: self.id)
  end
end
