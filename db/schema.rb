# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 23) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "full_name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "role"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "billing_details", :force => true do |t|
    t.integer  "billing_entry_id"
    t.integer  "stock_id"
    t.integer  "quantity"
    t.decimal  "rate",             :precision => 10, :scale => 2
    t.decimal  "total_amount",     :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billing_entries", :force => true do |t|
    t.integer  "admin_id"
    t.integer  "user_id"
    t.text     "comment"
    t.decimal  "discount",       :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "receipt_number"
    t.decimal  "total_sum",      :precision => 10, :scale => 2, :default => 0.0
  end

  create_table "countries", :force => true do |t|
    t.string "country_code"
    t.string "country_name"
  end

  create_table "ecards", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.string   "father_full_name"
    t.string   "mother_full_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "father_email"
    t.string   "mother_email"
    t.string   "father_cell_phone"
    t.string   "mother_cell_phone"
    t.string   "home_phone"
    t.string   "father_office_phone"
    t.string   "mother_office_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.string   "status",     :default => "0"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id"], :name => "message_fc"

  create_table "page_contents", :force => true do |t|
    t.string   "page_name"
    t.string   "page_title"
    t.text     "page_content"
    t.enum     "status",       :limit => [:Show, :Hide]
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.integer "country_id"
    t.string  "country_code"
    t.string  "state_code"
    t.string  "state_name"
  end

  create_table "stock_vendor_details", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "stock_id"
    t.float    "rate"
    t.integer  "quantity"
    t.float    "total"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stock_vendor_details", ["stock_id"], :name => "stock_id_fkey"
  add_index "stock_vendor_details", ["vendor_id"], :name => "vendor_id_fkey"

  create_table "stocks", :force => true do |t|
    t.string   "item_name"
    t.text     "item_description"
    t.integer  "item_quantity"
    t.float    "item_unit_rate"
    t.string   "item_unit_type"
    t.integer  "min_stock"
    t.integer  "max_stock"
    t.integer  "lock_version",     :default => 0
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "buying_rate"
  end

  create_table "user_schedules", :force => true do |t|
    t.integer  "user_id"
    t.date     "vaccination_date"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "memo"
  end

  create_table "user_vaccines", :force => true do |t|
    t.integer  "user_id"
    t.integer  "vaccine_id"
    t.date     "vaccine_date"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "code"
    t.string   "fname"
    t.string   "mname"
    t.string   "lname"
    t.date     "dob"
    t.time     "tob"
    t.enum     "sex",              :limit => [:M, :F]
    t.string   "height"
    t.string   "weight"
    t.string   "birth_address"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password", :limit => 40
    t.string   "salt",             :limit => 40
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vaccines", :force => true do |t|
    t.string   "vaccine_name"
    t.text     "vaccine_description"
    t.integer  "vaccination_time_from"
    t.integer  "vaccination_time_to"
    t.string   "vaccination_time_format"
    t.string   "vaccine_type"
    t.string   "vaccine_side_effects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cell_number"
    t.string   "office_phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "paid_amount",  :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "due_amount",   :precision => 10, :scale => 2, :default => 0.0
  end

end
