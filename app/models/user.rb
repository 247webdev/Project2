class User < ActiveRecord::Base
  has_secure_password
  has_many :gifts
  has_many :comments
  accepts_nested_attributes_for :gifts
end
