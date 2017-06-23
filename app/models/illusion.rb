class Illusion < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :starrings
  has_many :starrers, through: :starrings, source: :user
  has_many :illusion_tags
  has_many :tags, through: :illusion_tags, source: :tag
  validates :title, :url, presence: true


end
