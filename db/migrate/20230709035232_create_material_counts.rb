class CreateMaterialCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :material_counts do |t|
      t.integer :count, null: false
      t.references :material_num, null: false, foreign_key: true
      t.references :count_day, null: false, foreign_key: true
      t.timestamps
    end
  end
end
