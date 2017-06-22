class Tag < ApplicationRecord
  has_many :illusion_tags
  has_many :illusions, through: :illusion_tags

  def tags_with_illusions_by_status(user)
    all_tag_illusions = self.illusions
    appropriate_intensity_illusions_by_tag = all_tag_illusions.where(intense: user.master)
    appropriate_intensity_illusions_by_tag.count > 0
  end

  def self.find_appropriate_tags(user)
    Tag.all.select do |tag|
      tag.tags_with_illusions_by_status(user)
    end
  end

  def self.find_appropriate_unlogged_in_tags
    Tag.all.select do |tag|
      tag_count = tag.illusions.where(intense: false).length
      tag_count > 0
    end
  end
end
