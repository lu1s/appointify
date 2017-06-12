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

ActiveRecord::Schema.define(version: 20170529214754) do

  create_table "appointments", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "user_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "calendar_ranges", force: :cascade do |t|
    t.integer "week_day_id"
    t.integer "calendar_id"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_calendar_ranges_on_calendar_id"
    t.index ["week_day_id"], name: "index_calendar_ranges_on_week_day_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "superuser_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_calendars_on_company_id"
    t.index ["superuser_id"], name: "index_calendars_on_superuser_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "legal_name"
    t.string "website"
    t.string "facebook_page"
    t.string "twitter_page"
    t.string "phone_number"
    t.string "phone_number2"
    t.string "email"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "password_recovery"
    t.string "auth_token"
    t.string "facebook_token"
    t.string "twitter_token"
    t.string "google_token"
    t.boolean "active"
    t.datetime "last_activity"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paid_codes", force: :cascade do |t|
    t.string "code"
    t.boolean "used"
    t.datetime "usedon"
    t.integer "superuser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "super_users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "password_recovery"
    t.string "auth_token"
    t.string "facebook_token"
    t.string "twitter"
    t.string "google_token"
    t.boolean "active"
    t.datetime "last_activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter"], name: "index_super_users_on_twitter", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "password_recovery"
    t.string "auth_token"
    t.string "facebook_token"
    t.string "twitter_token"
    t.string "google_token"
    t.boolean "active"
    t.datetime "last_activity"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.integer "superuser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["superuser_id"], name: "index_users_on_superuser_id"
  end

  create_table "week_days", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
