class AddReferencesToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_reference :invitations, :invitee, foreign_key: { to_table: :users }
    add_reference :invitations, :event
  end
end
