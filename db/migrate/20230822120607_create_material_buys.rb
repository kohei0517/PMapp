class CreateMaterialBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :material_buys do |t|
      t.date :buy_day, null: false
      t.integer :count, null: false
      t.references :count_day, null: false, foreign_key: true
      t.references :material_num, null: false, foreign_key: true
      t.timestamps
    end
  end
end
