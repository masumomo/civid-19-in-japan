# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_13_131215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "statistics", force: :cascade do |t|
    t.string "name_ja"
    t.integer "total_count"
    t.integer "male_count"
    t.integer "male_00s"
    t.integer "male_10s"
    t.integer "male_20s"
    t.integer "male_30s"
    t.integer "male_40s"
    t.integer "male_50s"
    t.integer "male_60s"
    t.integer "male_70s"
    t.integer "male_80s"
    t.integer "male_90s"
    t.integer "male_100s"
    t.integer "male_unknown"
    t.integer "female_count"
    t.integer "female_00s"
    t.integer "female_10s"
    t.integer "female_20s"
    t.integer "female_30s"
    t.integer "female_40s"
    t.integer "female_50s"
    t.integer "female_60s"
    t.integer "female_70s"
    t.integer "female_80s"
    t.integer "female_90s"
    t.integer "female_100s"
    t.integer "female_unknown"
    t.integer "unknown_gender_count"
    t.integer "unknown_gender_00s"
    t.integer "unknown_gender_10s"
    t.integer "unknown_gender_20s"
    t.integer "unknown_gender_30s"
    t.integer "unknown_gender_40s"
    t.integer "unknown_gender_50s"
    t.integer "unknown_gender_60s"
    t.integer "unknown_gender_70s"
    t.integer "unknown_gender_80s"
    t.integer "unknown_gender_90s"
    t.integer "unknown_gender_100s"
    t.integer "unknown_gender_unknown"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "totals", force: :cascade do |t|
    t.integer "date"
    t.integer "pcr"
    t.integer "hospitalize"
    t.integer "positive"
    t.integer "severe"
    t.integer "discharge"
    t.integer "death"
    t.integer "symptom_confirming"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
