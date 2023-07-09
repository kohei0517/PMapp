class CreateMaterialCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :material_counts do |t|
      t.integer :count
      t.timestamps
    end
  end
end
