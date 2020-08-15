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

ActiveRecord::Schema.define(version: 2020_04_13_144943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amounts", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
    t.string "measurement"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.string "user_id"
    t.string "recipe_url"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "author"
    t.string "comments"
    t.integer "ratings"
    t.integer "recipe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "user_name"
    t.string "img_url"
  end

end
