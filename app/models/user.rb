class User < ActiveRecord::Base
  has_secure_password
  has_many :gifts, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :gifts, allow_destroy: true
  validates :first_name, presence: true, length: {maximum: 100}
  # validates :last_name, presence: true, length: {maximum: 100}
  validates :email, presence: true, uniqueness: true
  validates :zipcode, presence: true
  #, length: {minimum: 6, maximum: 20}
end
