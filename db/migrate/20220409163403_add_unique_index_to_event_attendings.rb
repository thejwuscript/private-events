class AddUniqueIndexToEventAttendings < ActiveRecord::Migration[7.0]
  def change
    add_index :event_attendings, [:attendee, :attended_event], unique: true
  end
end
