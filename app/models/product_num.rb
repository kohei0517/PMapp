class ProductNum < ApplicationRecord
  belongs_to :material_num
  validates :product_number, presence: true
  validates :name, presence: true
  validates :material_count, presence: true
end
