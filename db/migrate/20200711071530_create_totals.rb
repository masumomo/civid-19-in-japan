class CreateTotals < ActiveRecord::Migration[6.0]
  def change
    create_table :totals do |t|
      t.integer :date, unique: true
      t.integer :pcr
      t.integer :hospitalize
      t.integer :positive
      t.integer :severe
      t.integer :discharge
      t.integer :death
      t.integer :symptom_confirming
      t.timestamps
    end
  end
end
