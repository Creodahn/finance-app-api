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

ActiveRecord::Schema.define(version: 20171202024912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_debt", default: false, null: false
    t.boolean "require_routing_number", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string "account_number"
    t.decimal "balance"
    t.string "description"
    t.decimal "interest_rate"
    t.string "name"
    t.string "routing_number"
    t.bigint "account_type_id"
    t.bigint "group_id"
    t.bigint "interest_rate_type_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type_id"], name: "index_accounts_on_account_type_id"
    t.index ["group_id"], name: "index_accounts_on_group_id"
    t.index ["interest_rate_type_id"], name: "index_accounts_on_interest_rate_type_id"
    t.index ["profile_id"], name: "index_accounts_on_profile_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "apartment_number"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.boolean "is_primary"
    t.bigint "contact_info_type_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_info_type_id"], name: "index_addresses_on_contact_info_type_id"
    t.index ["profile_id"], name: "index_addresses_on_profile_id"
  end

  create_table "audits", force: :cascade do |t|
    t.string "action"
    t.string "column_name"
    t.string "previous_value"
    t.string "current_value"
    t.string "auditable_type"
    t.bigint "auditable_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auditable_type", "auditable_id"], name: "index_audits_on_auditable_type_and_auditable_id"
    t.index ["profile_id"], name: "index_audits_on_profile_id"
  end

  create_table "contact_info_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "phone_only"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "file_name"
    t.string "url"
    t.text "description"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.bigint "uploader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
    t.index ["uploader_id"], name: "index_images_on_uploader_id"
  end

  create_table "interest_rate_types", force: :cascade do |t|
    t.string "description"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["profile_id"], name: "index_memberships_on_profile_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "country_code"
    t.string "area_code"
    t.string "prefix"
    t.string "subscriber_number"
    t.string "extension"
    t.boolean "is_primary"
    t.bigint "contact_info_type_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_info_type_id"], name: "index_phone_numbers_on_contact_info_type_id"
    t.index ["profile_id"], name: "index_phone_numbers_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_profiles_on_email"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.boolean "is_debit", default: false, null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", null: false
    t.bigint "account_id"
    t.bigint "profile_id"
    t.bigint "transaction_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["profile_id"], name: "index_transactions_on_profile_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.date "authenticated_at"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
