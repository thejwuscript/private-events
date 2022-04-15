class ChageRefOnEventAttendings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :event_attendings, :attendee
    remove_reference :event_attendings, :attended_event
    add_reference :event_attendings, :attendee, foreign_key: { to_table: :users }
    add_reference :event_attendings, :attended_event, foreign_key: { to_table: :events }
  end
end
