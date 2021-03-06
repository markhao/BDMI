# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150823052102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "place_of_birth"
    t.date     "birthday"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "biography"
  end

  create_table "castings", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "actor_id"
    t.integer  "ord"
    t.string   "act_as"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "castings", ["actor_id"], name: "index_castings_on_actor_id", using: :btree
  add_index "castings", ["movie_id"], name: "index_castings_on_movie_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image_url",      null: false
    t.string   "thumbnil_url"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "author_id",     null: false
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "likes", ["author_id"], name: "index_likes_on_author_id", using: :btree
  add_index "likes", ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title",        null: false
    t.date     "release_date"
    t.integer  "runtime"
    t.float    "vote_average"
    t.integer  "vote_count"
    t.float    "popularity"
    t.text     "overview"
    t.string   "imdb_id"
    t.integer  "revenue"
    t.string   "tagline"
    t.integer  "budget"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "posters", force: :cascade do |t|
    t.string   "poster_url", null: false
    t.integer  "movie_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posters", ["movie_id"], name: "index_posters_on_movie_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.integer  "movie_id",   null: false
    t.integer  "grade",      null: false
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["author_id"], name: "index_reviews_on_author_id", using: :btree
  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "movie_id",   null: false
    t.integer  "genre_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["genre_id"], name: "index_taggings_on_genre_id", using: :btree
  add_index "taggings", ["movie_id"], name: "index_taggings_on_movie_id", using: :btree

  create_table "trailers", force: :cascade do |t|
    t.string   "source",     null: false
    t.integer  "movie_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trailers", ["movie_id"], name: "index_trailers_on_movie_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "wantwatchmovies", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "movie_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wantwatchmovies", ["movie_id"], name: "index_wantwatchmovies_on_movie_id", using: :btree
  add_index "wantwatchmovies", ["user_id"], name: "index_wantwatchmovies_on_user_id", using: :btree

  create_table "watchedmovies", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "movie_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "watchedmovies", ["movie_id"], name: "index_watchedmovies_on_movie_id", using: :btree
  add_index "watchedmovies", ["user_id"], name: "index_watchedmovies_on_user_id", using: :btree

end
