class RemoveIndexFromEventAttendings < ActiveRecord::Migration[7.0]
  def change
    remove_index :event_attendings, name: "index_event_attendings_on_attendee_and_attended_event"
  end
end
