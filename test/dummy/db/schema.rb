# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_09_164545) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dunnas_blog_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_dunnas_blog_categories_on_parent_id"
  end

  create_table "dunnas_blog_post_tags", id: :serial, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_dunnas_blog_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_dunnas_blog_post_tags_on_tag_id"
  end

  create_table "dunnas_blog_posts", id: :serial, force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "title"
    t.text "description"
    t.string "archive"
    t.boolean "active", default: true
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_dunnas_blog_posts_on_category_id"
  end

  create_table "dunnas_blog_tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dunnas_seo_seos", id: :serial, force: :cascade do |t|
    t.string "metatag_title"
    t.string "metatag_description"
    t.string "metatag_language"
    t.text "metatag_keywords"
    t.string "metatag_author"
    t.string "metatag_robots"
    t.string "metatag_revisitafter"
    t.string "metatag_charset"
    t.string "metatag_ogimage"
    t.string "metatag_ogurl"
    t.string "metatag_ogtype"
    t.string "metatag_googleboot"
    t.string "metatag_tcard"
    t.string "metatag_tsite"
    t.string "metatag_tcreator"
    t.text "google_anlytics"
    t.text "google_adsence"
    t.text "google_adsence_responsive"
    t.text "google_search"
    t.text "google_maps"
    t.text "facebook_pixel"
    t.text "one_signal"
    t.text "onesignal_appid"
    t.text "onesignal_restapi"
    t.text "jivochat"
    t.text "terms_of_use"
    t.text "privacy_policy"
    t.text "our_story"
    t.text "mission"
    t.text "vision"
    t.text "values"
    t.text "about"
    t.string "photo_about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dunnas_blog_categories", "dunnas_blog_categories", column: "parent_id"
  add_foreign_key "dunnas_blog_post_tags", "dunnas_blog_posts", column: "post_id"
  add_foreign_key "dunnas_blog_post_tags", "dunnas_blog_tags", column: "tag_id"
  add_foreign_key "dunnas_blog_posts", "dunnas_blog_categories", column: "category_id"
end
