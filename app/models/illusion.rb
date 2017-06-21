class Illusion < ApplicationRecord
  # belongs_to :creator, class_name: :Users
  # has_many :illusions_tags
  # has_many :tags, through: :illusions_tags
  # has_many :starrings
  # has_many :starrers, through: :starrings, source: :user

  validates :title, :url, :creator_id, presence: true
end
