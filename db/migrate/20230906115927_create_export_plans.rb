class CreateExportPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :export_plans do |t|
      t.date :export_day, null: false
      t.integer :count, null: false
      t.references :count_day, null: false, foreign_key: true
      t.references :product_num, null: false, foreign_key: true
      t.timestamps
    end
  end
end
