class CreateMaterialNums < ActiveRecord::Migration[6.0]
  def change
    create_table :material_nums do |t|
      t.string :product_num
      t.string :name
      t.timestamps
    end
  end
end
