class CreateMaterialNums < ActiveRecord::Migration[6.0]
  def change
    create_table :material_nums do |t|
      t.string :product_number, null: false
      t.string :name,        null: false
      t.timestamps
    end
  end
end
