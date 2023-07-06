class CreateProductNums < ActiveRecord::Migration[6.0]
  def change
    create_table :product_nums do |t|
      t.string :product_number, null: false
      t.string :name, null: false
      t.integer :material_count, null: false
      t.references :material_num, null: false, foreign_key: true
      t.timestamps
    end
  end
end
