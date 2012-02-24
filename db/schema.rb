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

ActiveRecord::Schema.define(:version => 20120223081026) do

  create_table "test_link_results", :force => true do |t|
    t.string   "url"
    t.integer  "code"
    t.string   "title"
    t.integer  "depth"
    t.string   "referer"
    t.string   "content_type"
    t.integer  "response_time"
    t.integer  "test_links_id"
    t.string   "headers"
    t.string   "from_link_text"
    t.integer  "from_link_line_number"
    t.integer  "out_links_number"
    t.string   "links"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_links", :force => true do |t|
    t.text     "urls",         :limit => 100000
    t.integer  "test_task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_links", ["test_task_id"], :name => "index_test_links_on_test_task_id"

  create_table "test_settings", :force => true do |t|
    t.integer  "threads",      :default => 1
    t.integer  "depth_limit",  :default => 0
    t.boolean  "subdomains",   :default => true
    t.integer  "test_task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_settings", ["test_task_id"], :name => "index_test_settings_on_test_task_id"

  create_table "test_tasks", :force => true do |t|
    t.string   "person"
    t.datetime "checktime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "result",     :default => "nil"
  end

end
