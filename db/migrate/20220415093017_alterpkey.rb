class Alterpkey < ActiveRecord::Migration[7.0]
  def change
    max_id = execute("SELECT id FROM event_attendings ORDER BY id DESC LIMIT 1").to_a.first
    execute("ALTER TABLE event_attendings RENAME COLUMN id TO id_orig")
    execute("ALTER TABLE event_attendings ADD COLUMN id bigserial NOT NULL")
    execute("UPDATE event_attendings SET id=id_orig")
    execute("ALTER SEQUENCE event_attendings_id_seq RESTART 1")
    execute("ALTER TABLE event_attendings DROP COLUMN id_orig")
  end
end
