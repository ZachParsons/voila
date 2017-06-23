class Starring < ApplicationRecord
  belongs_to :illusion
  belongs_to :starrer, class_name: :User, foreign_key: :starrer_id

  # validates :illusion, uniqueness: {scope: :starrer,
  #   message: "Only able to star an illusion once."
  # }
end
