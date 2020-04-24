# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_24_171006) do

  create_table "actors_movies", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_actors_movies_on_movie_id"
    t.index ["person_id"], name: "index_actors_movies_on_person_id"
  end

  create_table "directors_movies", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_directors_movies_on_movie_id"
    t.index ["person_id"], name: "index_directors_movies_on_person_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "aliases"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "producers_movies", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_producers_movies_on_movie_id"
    t.index ["person_id"], name: "index_producers_movies_on_person_id"
  end

  add_foreign_key "actors_movies", "movies"
  add_foreign_key "actors_movies", "people"
  add_foreign_key "directors_movies", "movies"
  add_foreign_key "directors_movies", "people"
  add_foreign_key "producers_movies", "movies"
  add_foreign_key "producers_movies", "people"
end
