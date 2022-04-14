class AddReferenceEventToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_reference :invitations, :invited_event, foreign_key: { to_table: :events }
  end
end
