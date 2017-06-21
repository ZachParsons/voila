class User < ApplicationRecord
  has_secure_password

  has_many :illusions
  has_many :starrings, foreign_key: :starrer_id

end
