ActiveRecord::Schema.define(version: 2023_04_22_135916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "email"
    t.string "password_digest"
    t.text "favorite_genres"
    t.datetime "date_joined"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
