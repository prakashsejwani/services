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

ActiveRecord::Schema.define(:version => 20100605114436) do

  create_table "assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "attachings_count",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachings", :force => true do |t|
    t.integer  "attachable_id"
    t.integer  "asset_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachings", ["asset_id"], :name => "index_attachings_on_asset_id"
  add_index "attachings", ["attachable_id"], :name => "index_attachings_on_attachable_id"

  create_table "avatars", :force => true do |t|
    t.string   "filename"
    t.string   "content_type"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "parent_id"
    t.integer  "height"
    t.integer  "width"
    t.integer  "asset_id"
    t.string   "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "alphabet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "businesses", ["alphabet"], :name => "index_businesses_on_alphabet"

  create_table "careers", :force => true do |t|
    t.string   "name",                :limit => 50
    t.string   "email",               :limit => 50
    t.string   "post",                :limit => 50
    t.string   "city",                :limit => 50
    t.string   "tel",                 :limit => 20
    t.string   "mobile",              :limit => 20
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
    t.string   "alphabet"
    t.boolean  "delta"
    t.boolean  "popular",     :default => false
  end

  create_table "categorizations", :force => true do |t|
    t.integer "category_id"
    t.integer "company_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.integer  "locality_id"
    t.integer  "city_id"
    t.string   "state"
    t.string   "country"
    t.string   "pincode"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "email"
    t.string   "contact"
    t.text     "about"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_ad_file_name"
    t.string   "image_ad_content_type"
    t.integer  "image_ad_file_size"
    t.datetime "image_ad_updated_at"
    t.boolean  "approved",              :default => false
    t.string   "other_category"
    t.boolean  "imageapprove",          :default => false
    t.boolean  "videoapprove",          :default => false
    t.integer  "owner_id"
    t.boolean  "delta"
    t.integer  "reviews_count",         :default => 0
    t.boolean  "priority",              :default => false
    t.date     "from_date"
    t.date     "to_date"
    t.boolean  "scroll_ads",            :default => false
    t.string   "ad_url"
    t.date     "image_from_date"
    t.date     "image_to_date"
    t.date     "video_from_date"
    t.date     "video_to_date"
    t.boolean  "popular_catlog",        :default => false
    t.boolean  "popular_services",      :default => false
  end

  add_index "companies", ["address1"], :name => "index_companies_on_address1"
  add_index "companies", ["address2"], :name => "index_companies_on_address2"
  add_index "companies", ["business_id"], :name => "index_companies_on_business_id"
  add_index "companies", ["city_id"], :name => "index_companies_on_city_id"
  add_index "companies", ["locality_id"], :name => "index_companies_on_locality_id"
  add_index "companies", ["name"], :name => "index_companies_on_name"
  add_index "companies", ["pincode"], :name => "index_companies_on_pincode"

  create_table "images", :force => true do |t|
    t.integer  "asset_id"
    t.string   "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ad_file_name"
    t.string   "ad_content_type"
    t.integer  "ad_file_size"
    t.datetime "ad_updated_at"
  end

  add_index "images", ["asset_id"], :name => "index_images_on_asset_id"

  create_table "localities", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "localities", ["city_id"], :name => "index_localities_on_city_id"

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "real_name"
    t.string   "location"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id"], :name => "index_rates_on_rateable_id"
  add_index "rates", ["user_id"], :name => "index_rates_on_user_id"

  create_table "reviews", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.boolean  "approved",               :default => false
    t.string   "review_ad_file_name"
    t.string   "review_ad_content_type"
    t.integer  "review_ad_file_size"
    t.datetime "review_ad_updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "settings", :force => true do |t|
    t.string   "label"
    t.string   "identifier"
    t.text     "description"
    t.string   "field_type",  :default => "string"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "identity_url"
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.string   "activation_code",           :limit => 40
    t.string   "state",                                    :default => "passive"
    t.datetime "remember_token_expires_at"
    t.string   "password_reset_cod"
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "videos", :force => true do |t|
    t.integer  "asset_id"
    t.string   "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  add_index "videos", ["asset_id"], :name => "index_videos_on_asset_id"

end
