class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendings
  has_many :invitations, dependent: :destroy

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }
  
  validates :name, presence: true, uniqueness: true
  validates :date, presence: true
  validates :location, presence: true, uniqueness: true

  #def Event.past
  #  Event.all.where("date < ?", Time.now)
  #end

  #def Event.upcoming
  #  Event.all.where("date > ?", Time.now)
  #end

end
