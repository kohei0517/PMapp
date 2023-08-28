class MaterialNum < ApplicationRecord
  has_many :product_nums
  has_many :material_counts
  has_many :material_plans
  has_many :material_buys
  
  validates :product_number,   presence: true
  validates :name,   presence: true
end
