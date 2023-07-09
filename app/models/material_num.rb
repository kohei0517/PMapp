class MaterialNum < ApplicationRecord
  has_many :product_nums
  validates :product_number,   presence: true
  validates :name,   presence: true
end
