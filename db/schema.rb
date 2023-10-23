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

ActiveRecord::Schema[7.0].define(version: 2023_10_05_135830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_recipes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_favorite_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_favorite_recipes_on_user_id"
  end

  create_table "favorite_wisdoms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "wisdom_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorite_wisdoms_on_user_id"
    t.index ["wisdom_board_id"], name: "index_favorite_wisdoms_on_wisdom_board_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_comments_on_recipe_id"
    t.index ["user_id"], name: "index_recipe_comments_on_user_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ingredient_id"
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipe_photos", force: :cascade do |t|
    t.string "image"
    t.text "description"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_photos_on_recipe_id"
  end

  create_table "recipe_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_type_of_tags", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "recipe_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_type_of_tags_on_recipe_id"
    t.index ["recipe_tag_id"], name: "index_recipe_type_of_tags_on_recipe_tag_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "photo"
    t.integer "cooking_time", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string "item", null: false
    t.text "notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_units_on_ingredient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wisdom_boards", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_wisdom_boards_on_user_id"
  end

  create_table "wisdom_comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "user_id"
    t.bigint "wisdom_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wisdom_comments_on_user_id"
    t.index ["wisdom_board_id"], name: "index_wisdom_comments_on_wisdom_board_id"
  end

  create_table "wisdom_photos", force: :cascade do |t|
    t.string "image"
    t.text "description"
    t.bigint "wisdom_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wisdom_board_id"], name: "index_wisdom_photos_on_wisdom_board_id"
  end

  create_table "wisdom_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wisdom_type_of_tags", force: :cascade do |t|
    t.bigint "wisdom_board_id"
    t.bigint "wisdom_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wisdom_board_id"], name: "index_wisdom_type_of_tags_on_wisdom_board_id"
    t.index ["wisdom_tag_id"], name: "index_wisdom_type_of_tags_on_wisdom_tag_id"
  end

  add_foreign_key "favorite_recipes", "recipes"
  add_foreign_key "favorite_recipes", "users"
  add_foreign_key "favorite_wisdoms", "users"
  add_foreign_key "favorite_wisdoms", "wisdom_boards"
  add_foreign_key "recipe_comments", "recipes"
  add_foreign_key "recipe_comments", "users"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipe_photos", "recipes"
  add_foreign_key "recipe_type_of_tags", "recipe_tags"
  add_foreign_key "recipe_type_of_tags", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "shopping_lists", "users"
  add_foreign_key "units", "ingredients"
  add_foreign_key "wisdom_boards", "users"
  add_foreign_key "wisdom_comments", "users"
  add_foreign_key "wisdom_comments", "wisdom_boards"
  add_foreign_key "wisdom_photos", "wisdom_boards"
  add_foreign_key "wisdom_type_of_tags", "wisdom_boards"
  add_foreign_key "wisdom_type_of_tags", "wisdom_tags"
end
