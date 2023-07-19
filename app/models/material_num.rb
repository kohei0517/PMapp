class MaterialNum < ApplicationRecord
  has_many :product_nums
  has_many :material_counts
  
  validates :product_number,   presence: true
  validates :name,   presence: true
end
