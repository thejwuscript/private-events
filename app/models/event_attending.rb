class EventAttending < ApplicationRecord
  belongs_to :attendee, class_name: "User", optional: true
  belongs_to :attended_event, class_name: "Event", optional: true
  validates :attendee, uniqueness: { scope: :attended_event }
  # consider race condition?
end
