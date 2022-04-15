# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_15_135345) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_attendings", id: false, force: :cascade do |t|
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.bigint "attendee_id"
    t.bigint "attended_event_id"
    t.bigserial "id", null: false
    t.index ["attended_event_id"], name: "index_event_attendings_on_attended_event_id"
    t.index ["attendee_id"], name: "index_event_attendings_on_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "name"
    t.date "date"
    t.text "location"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.bigint "creator_id"
    t.index ["creator_id"], name: "idx_18784_index_events_on_creator_id"
  end

  create_table "invitations", id: :bigint, default: -> { "nextval('invitation_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.bigint "invitee_id"
    t.bigint "invited_event_id"
    t.index ["invited_event_id"], name: "idx_18790_index_invitations_on_invited_event_id"
    t.index ["invitee_id"], name: "idx_18790_index_invitations_on_invitee_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", default: ""
    t.text "encrypted_password", default: ""
    t.text "reset_password_token"
    t.timestamptz "reset_password_sent_at"
    t.timestamptz "remember_created_at"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.text "name"
    t.index ["email"], name: "idx_18775_index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "idx_18775_index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_attendings", "events", column: "attended_event_id"
  add_foreign_key "event_attendings", "users", column: "attendee_id"
  add_foreign_key "events", "users", column: "creator_id", name: "events_creator_id_fkey"
  add_foreign_key "invitations", "events", column: "invited_event_id", name: "invitations_invited_event_id_fkey"
  add_foreign_key "invitations", "users", column: "invitee_id", name: "invitations_invitee_id_fkey"
end
