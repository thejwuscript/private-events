class ChangePKeyOnEventAttendings < ActiveRecord::Migration[7.0]
  def change
    change_column :event_attendings, :id, :int, null: false, unique: true, auto_increment: true, primary_key: true
  end
end
