class Starring < ApplicationRecord
  belongs_to :illusion
  belongs_to :starrer, class_name: :User
end