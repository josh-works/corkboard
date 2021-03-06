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

ActiveRecord::Schema.define(version: 20170608030441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.index ["attachable_id"], name: "index_attachments_on_attachable_id", using: :btree
    t.index ["attachable_type"], name: "index_attachments_on_attachable_type", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "amount"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_bids_on_project_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "query_id"
    t.text     "statement"
    t.string   "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id", using: :btree
    t.index ["user_id"], name: "index_blazer_audits_on_user_id", using: :btree
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "query_id"
    t.string   "state"
    t.string   "schedule"
    t.text     "emails"
    t.string   "check_type"
    t.text     "message"
    t.datetime "last_run_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id", using: :btree
    t.index ["query_id"], name: "index_blazer_checks_on_query_id", using: :btree
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.integer  "dashboard_id"
    t.integer  "query_id"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id", using: :btree
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id", using: :btree
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.integer  "creator_id"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id", using: :btree
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.text     "statement"
    t.string   "data_source"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "industry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["industry_id"], name: "index_categories_on_industry_id", using: :btree
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "bid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bid_id"], name: "index_messages_on_bid_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "pro_services", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "service_ids",              array: true
    t.string   "radius"
    t.index ["user_id"], name: "index_pro_services_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "status",       default: 0
    t.string   "zipcode"
    t.boolean  "recurring",    default: false
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "timeline",     default: 0
    t.integer  "requester_id"
    t.integer  "service_id"
    t.index ["requester_id"], name: "index_projects_on_requester_id", using: :btree
    t.index ["service_id"], name: "index_projects_on_service_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rating"
    t.text     "body"
    t.integer  "pro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "service_id"
    t.index ["service_id"], name: "index_reviews_on_service_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["category_id"], name: "index_services_on_category_id", using: :btree
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zipcode"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "uid"
    t.string   "type"
    t.string   "password"
    t.string   "password_digest"
    t.string   "verification_code"
  end

  add_foreign_key "bids", "projects"
  add_foreign_key "bids", "users"
  add_foreign_key "categories", "industries"
  add_foreign_key "messages", "bids"
  add_foreign_key "messages", "users"
  add_foreign_key "pro_services", "users"
  add_foreign_key "services", "categories"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
