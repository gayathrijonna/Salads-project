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

ActiveRecord::Schema[7.0].define(version: 2023_05_02_050306) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "curated_salads", force: :cascade do |t|
    t.string "saladName"
    t.string "saladIngredients"
    t.integer "calories"
    t.decimal "price_cents"
    t.integer "quantities"
    t.boolean "outOfStock"
    t.boolean "isVegan"
    t.boolean "isAllMeat"
    t.boolean "isAllGreens"
    t.boolean "isTropical"
    t.boolean "isDiaryDiet"
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_profile_items", force: :cascade do |t|
    t.string "salad_name"
    t.integer "salad_id"
    t.integer "price_cents"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "delivery_profiles_id"
    t.index ["delivery_profiles_id"], name: "index_delivery_profile_items_on_delivery_profiles_id"
  end

  create_table "delivery_profiles", force: :cascade do |t|
    t.string "profile_name"
    t.integer "dressings"
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "userdata_id"
    t.index ["userdata_id"], name: "index_delivery_profiles_on_userdata_id"
  end

  create_table "icategories", force: :cascade do |t|
    t.string "itype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "iname"
    t.integer "icalorie"
    t.integer "ifat"
    t.integer "icarbo"
    t.integer "iprotein"
    t.boolean "isAllMeat"
    t.boolean "isAllGreens"
    t.boolean "isVegan"
    t.boolean "icheck"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "icategory_id"
    t.index ["icategory_id"], name: "index_ingredients_on_icategory_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "cardnumber"
    t.string "cardholdername"
    t.integer "expirydate"
    t.integer "cvv"
    t.integer "zipcode"
    t.string "paymentstatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "likes"
    t.integer "dislikes"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cart_items", force: :cascade do |t|
    t.string "salad_name"
    t.integer "quantities"
    t.decimal "price_cents"
    t.string "dressing"
    t.integer "salad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usercart_id"
    t.index ["usercart_id"], name: "index_user_cart_items_on_usercart_id"
  end

  create_table "user_vitals_and_preferences", force: :cascade do |t|
    t.string "gender"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.integer "weighttobe"
    t.boolean "isVegan"
    t.boolean "isGlutenFree"
    t.boolean "isAllGreens"
    t.boolean "isAllMeats"
    t.boolean "isTropical"
    t.boolean "isBasics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "userdata_id"
    t.index ["userdata_id"], name: "index_user_vitals_and_preferences_on_userdata_id"
  end

  create_table "usercarts", force: :cascade do |t|
    t.string "dressing_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "userdata_id"
    t.index ["userdata_id"], name: "index_usercarts_on_userdata_id"
  end

  create_table "userdata", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "emailid"
    t.string "mobile"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_userdata_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.boolean "reg_done"
    t.integer "counter", default: 10
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "delivery_profile_items", "delivery_profiles", column: "delivery_profiles_id"
  add_foreign_key "delivery_profiles", "userdata", column: "userdata_id"
  add_foreign_key "ingredients", "icategories"
  add_foreign_key "user_cart_items", "usercarts"
  add_foreign_key "user_vitals_and_preferences", "userdata", column: "userdata_id"
  add_foreign_key "usercarts", "userdata", column: "userdata_id"
  add_foreign_key "userdata", "users"
end
