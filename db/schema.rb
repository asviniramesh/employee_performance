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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130305091849) do

  create_table "employees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "manager_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "employees", ["manager_id"], :name => "index_employees_on_manager_id"
  add_index "employees", ["user_id"], :name => "index_employees_on_user_id"

  create_table "evaluation_intervals", :force => true do |t|
    t.integer  "team_id"
    t.time     "frequency"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "evaluation_periods", :force => true do |t|
    t.time     "eval_start_date"
    t.time     "eval_end_date"
    t.integer  "team_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "evaluations", :force => true do |t|
    t.integer  "self_points"
    t.integer  "manager_points"
    t.integer  "final_points"
    t.text     "self_comments"
    t.text     "manager_comments"
    t.text     "final_comments"
    t.integer  "evaluation_period_id"
    t.integer  "value_id"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "interval_formats", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "role_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "level"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "team_values", :force => true do |t|
    t.integer  "team_id"
    t.integer  "value_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_histories", :force => true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "evaluation_period_id"
    t.time     "date"
    t.integer  "totalpoints"
    t.integer  "manager_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "phonenum"
    t.text     "address"
    t.integer  "team_id"
    t.integer  "role_id"
    t.string   "designation"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "values", :force => true do |t|
    t.text     "description"
    t.text     "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
