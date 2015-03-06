class User < ActiveRecord::Base
  has_secure_password
  has_many :gifts
  has_many :comments
end
