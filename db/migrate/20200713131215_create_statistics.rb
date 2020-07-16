class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table  :statistics do |t|
      t.string :name_ja, unique: true
      t.integer :total_count
      t.integer :male_count
      t.integer :male_00s
      t.integer :male_10s
      t.integer :male_20s
      t.integer :male_30s
      t.integer :male_40s
      t.integer :male_50s
      t.integer :male_60s
      t.integer :male_70s
      t.integer :male_80s
      t.integer :male_90s
      t.integer :male_100s
      t.integer :male_unknown
      t.integer :female_count
      t.integer :female_00s
      t.integer :female_10s
      t.integer :female_20s
      t.integer :female_30s
      t.integer :female_40s
      t.integer :female_50s
      t.integer :female_60s
      t.integer :female_70s
      t.integer :female_80s
      t.integer :female_90s
      t.integer :female_100s
      t.integer :female_unknown
      t.integer :unknown_gender_count
      t.integer :unknown_gender_00s
      t.integer :unknown_gender_10s
      t.integer :unknown_gender_20s
      t.integer :unknown_gender_30s
      t.integer :unknown_gender_40s
      t.integer :unknown_gender_50s
      t.integer :unknown_gender_60s
      t.integer :unknown_gender_70s
      t.integer :unknown_gender_80s
      t.integer :unknown_gender_90s
      t.integer :unknown_gender_100s
      t.integer :unknown_gender_unknown
      t.timestamps
    end
  end
end
