class DropDefault < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      ALTER TABLE event_attendings ALTER COLUMN id DROP DEFAULT;
    SQL
  end
end
