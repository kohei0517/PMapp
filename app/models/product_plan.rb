class ProductPlan < ApplicationRecord
  belongs_to :product_num
  belongs_to :count_day
end
