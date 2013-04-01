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

ActiveRecord::Schema.define(:version => 20130401104942) do

  create_table "employee_details", :force => true do |t|
    t.string   "designation"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "joining_date"
    t.string   "mobile_num"
    t.string   "phone_num"
    t.integer  "employee_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "employee_hierarchies", :force => true do |t|
    t.integer  "hierarchy_order"
    t.integer  "superior_id"
    t.integer  "employee_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "employee_histories", :force => true do |t|
    t.string   "changed_column_name"
    t.string   "changed_table_name"
    t.string   "changed_value"
    t.integer  "employee_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "employee_roles", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "role_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
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

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "employees", ["reset_password_token"], :name => "index_employees_on_reset_password_token", :unique => true

  create_table "evaluation_comments", :force => true do |t|
    t.text     "comment"
    t.integer  "evaluation_score_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "evaluation_frequencies", :force => true do |t|
    t.string   "format"
    t.date     "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "frequency"
  end

  create_table "evaluation_intervals", :force => true do |t|
    t.integer  "evaluation_frequency_id"
    t.integer  "value_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "evaluation_periods", :force => true do |t|
    t.date     "final_eval_end_date"
    t.date     "final_eval_start_date"
    t.date     "manager_eval_end_date"
    t.date     "manager_eval_start_date"
    t.date     "self_eval_end_date"
    t.date     "self_eval_start_date"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "evaluation_interval_id"
  end

  create_table "evaluation_scores", :force => true do |t|
    t.integer  "evaluator_id"
    t.integer  "submitter_id"
    t.integer  "score_id"
    t.integer  "evaluation_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "evaluation_statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "evaluation_summaries", :force => true do |t|
    t.integer  "total_score"
    t.integer  "employee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "evaluations", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "value_id"
    t.integer  "evaluation_period_id"
    t.integer  "evaluation_status_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
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
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scores", :force => true do |t|
    t.string   "description"
    t.string   "points"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "team_employees", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "team_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "values", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
