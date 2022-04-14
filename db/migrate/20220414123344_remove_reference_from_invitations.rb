class RemoveReferenceFromInvitations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :invitations, :event
  end
end
