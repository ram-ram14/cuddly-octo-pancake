ActiveRecord::Schema.define(version: 2023_04_26_005810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.text "title"
    t.text "plot"
    t.text "director"
    t.datetime "release_date"
    t.text "runtime"
    t.text "poster_image"
    t.text "cast"
    t.text "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movie_id"
    t.bigint "user_id"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "email"
    t.string "password_digest"
    t.text "favorite_genres"
    t.datetime "date_joined"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
end
