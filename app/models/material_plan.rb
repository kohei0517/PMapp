class MaterialPlan < ApplicationRecord
  belongs_to :material_num
  belongs_to :count_day
end
