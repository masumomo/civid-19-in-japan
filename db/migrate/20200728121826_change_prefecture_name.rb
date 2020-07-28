class ChangePrefectureName < ActiveRecord::Migration[6.0]
  change_table :statistics do |t|
    t.remove :name_ja
    t.string :name
  end
end
