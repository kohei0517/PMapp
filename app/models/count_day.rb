class CountDay < ApplicationRecord
  
  has_many :material_counts, dependent: :destroy
  has_many :product_counts, dependent: :destroy
  has_many :material_plans, dependent: :destroy
  has_many :product_plans, dependent: :destroy
  has_many :material_buys, dependent: :destroy
  has_many :export_plans,  dependent: :destroy

  validates :inventory_day, presence: true
  validates :inventory_finish, presence: true
  validate  :check_unique_month, unless: :updating?

  def updating?
    persisted?
  end

  def check_unique_month
    existing_records = CountDay.where("extract(year from inventory_day) = ? AND extract(month from inventory_day) = ?", inventory_day.year, inventory_day.month)
    if existing_records.exists?
      errors.add(:inventory_day, "同じ年月のレコードが既に存在します")
    end
  end
end
