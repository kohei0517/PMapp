class MaterialCount < ApplicationRecord
  belongs_to :count_day
  belongs_to :material_num

  validates :count, numericality: {only_integer: true}

end
