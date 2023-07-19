class ProductCount < ApplicationRecord
  belongs_to :count_day
  belongs_to :product_num

  validates :count, numericality: {only_integer: true}
  
end
