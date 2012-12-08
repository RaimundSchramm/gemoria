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

ActiveRecord::Schema.define(:version => 20121201182413) do

  create_table "acceptance_tests", :force => true do |t|
    t.integer  "userstory_id"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "complete"
  end

  add_index "acceptance_tests", ["userstory_id"], :name => "index_acceptance_tests_on_userstory_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.boolean  "complete"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "userstory_id"
  end

  add_index "tasks", ["userstory_id"], :name => "index_tasks_on_userstory_id"

  create_table "userstories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "complete"
    t.integer  "project_id"
    t.string   "status"
    t.text     "description"
  end

  add_index "userstories", ["project_id"], :name => "index_userstories_on_project_id"

end
