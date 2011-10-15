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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111014015846) do

  create_table "users", :force => true do |t|
    t.string   "first_name",         :limit => 75
    t.string   "last_name",          :limit => 75,  :null => false
    t.string   "email",                             :null => false
    t.string   "address"
    t.string   "city",               :limit => 100
    t.string   "state",              :limit => 25
    t.string   "zip",                :limit => 25
    t.string   "office_phone",       :limit => 25
    t.string   "cell_phone",         :limit => 25
    t.string   "fax",                :limit => 25
    t.integer  "user_type"
    t.integer  "approver_level_id"
    t.boolean  "employee"
    t.integer  "supervisor_id"
    t.integer  "ccb_member"
    t.string   "encrypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
