class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings
  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }

  #def Event.past
  #  Event.all.where("date < ?", Time.now)
  #end

  #def Event.upcoming
  #  Event.all.where("date > ?", Time.now)
  #end

end
