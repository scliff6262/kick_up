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

  def distance_from_user(user)
    resp = RestClient::Request.execute(
      method: :get,
      url: "https://www.zipcodeapi.com/rest/E76SZFyWQKK0FOcfvWvrsw4SFaC8x4BxvFCh8diaUe9YpktbJeo8nevbBlVpyBYu/distance.json/#{self.zip_code}/#{user.zip_code}/mile",
      headers: {api_key: "E76SZFyWQKK0FOcfvWvrsw4SFaC8x4BxvFCh8diaUe9YpktbJeo8nevbBlVpyBYu"}
      )

      JSON.parse(resp)["distance"]
  end
end
