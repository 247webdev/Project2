class User < ActiveRecord::Base
  has_many :gifts
  has_many :comments
end
