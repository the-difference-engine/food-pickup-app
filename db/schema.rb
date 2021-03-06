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

ActiveRecord::Schema.define(version: 20170130185920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donors", force: :cascade do |t|
    t.string   "email",                                          default: "",    null: false
    t.string   "encrypted_password",                             default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "business_name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "contact_name"
    t.string   "type_of_donor"
    t.boolean  "terms",                                          default: false
    t.boolean  "admin",                                          default: false
    t.boolean  "approved",                                       default: false
    t.decimal  "charge",                 precision: 6, scale: 2
    t.boolean  "negotiable",                                     default: false
    t.string   "customer_id"
    t.index ["confirmation_token"], name: "index_donors_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_donors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_donors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "food_pickups", force: :cascade do |t|
    t.string   "picture"
    t.text     "description"
    t.integer  "quantity"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "location"
    t.boolean  "approved",                             default: false
    t.string   "reoccurrence"
    t.integer  "donor_id"
    t.decimal  "charge",       precision: 5, scale: 2
    t.boolean  "paid",                                 default: false
  end

  create_table "shelters", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "volunteer_food_pickups", force: :cascade do |t|
    t.integer "volunteer_id"
    t.integer "food_pickup_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state",        limit: 2
    t.string   "street"
    t.bigint   "zipcode"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
