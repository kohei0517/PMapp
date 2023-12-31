class ProductNum < ApplicationRecord
  
  belongs_to :material_num
  has_many :product_counts
  has_many :product_plans


  validates :product_number, presence: true
  validates :name, presence: true
  validates :material_count, presence: true
end
