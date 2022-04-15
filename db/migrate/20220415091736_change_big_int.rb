class ChangeBigInt < ActiveRecord::Migration[7.0]
  def change
    change_column :event_attendings, :id, :bigint
  end
end
