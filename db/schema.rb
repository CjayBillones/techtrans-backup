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

ActiveRecord::Schema.define(version: 20161016181750) do

  create_table "academes", force: :cascade do |t|
    t.text     "user_bio"
    t.string   "user_type"
    t.string   "id_number"
    t.string   "contact_number"
    t.text     "address"
    t.string   "fb_url"
    t.string   "linkedin_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "edited_by_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id", "created_at"], name: "index_articles_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string   "industry_name"
    t.text     "organization_bio"
    t.string   "country_code"
    t.text     "address"
    t.string   "contact_person"
    t.string   "contact_email"
    t.string   "contact_number"
    t.string   "classification"
    t.integer  "employee_count",   default: 1, null: false
    t.string   "locations"
    t.string   "site_url"
    t.string   "fb_url"
    t.string   "linkedin_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "ip_needs", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.text     "features"
    t.text     "business_model"
    t.string   "privacy_option"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["user_id", "created_at"], name: "index_ip_needs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_ip_needs_on_user_id"
  end

  create_table "ip_offers", force: :cascade do |t|
    t.string   "title"
    t.text     "subtitle"
    t.text     "overview"
    t.text     "key_features"
    t.text     "applications"
    t.text     "customer_edge"
    t.text     "market_opportunity"
    t.text     "inventors"
    t.text     "patent_status"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["user_id", "created_at"], name: "index_ip_offers_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_ip_offers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "admin",             default: false
    t.string   "accounts_type"
    t.integer  "accounts_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["accounts_type", "accounts_id"], name: "index_users_on_accounts_type_and_accounts_id"
    t.index ["username", "email"], name: "index_users_on_username_and_email", unique: true
  end

end
