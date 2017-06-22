class User < ApplicationRecord
  has_secure_password

  # has_many :illusions
  has_many :illusions, foreign_key: :creator_id
  has_many :starrings, foreign_key: :starrer_id

  belongs_to :a_master, class_name: :User, foreign_key: :master_id, optional: true



  # after save could be a good refactor

  def check_master(secret_key_input)
    secret_key_input == "Frederiq"
  end

  def secret=(val)
  end

  def secret
  end

  def apprentices
    @apprectices = User.where(master: false, master_id: self.id)
  end
end




