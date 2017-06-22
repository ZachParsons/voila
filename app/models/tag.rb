class Tag < ApplicationRecord
  has_many :illusion_tags
  has_many :illusions, through: :illusion_tags
end
