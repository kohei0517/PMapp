class CreateProductCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :product_counts do |t|
      t.integer :count, null: false
      t.references :product_num, null: false, foreign_key: true
      t.references :count_day, null: false, foreign_key: true
      t.timestamps
    end
  end
end
