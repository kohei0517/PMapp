class CreateCountDays < ActiveRecord::Migration[6.0]
  def change
    create_table :count_days do |t|
      t.date :inventory_day
      t.integer :inventory_finish
      t.timestamps
    end
  end
end
