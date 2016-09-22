class User < ActiveRecord::Base
  has_many :gifts, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :gifts, allow_destroy: true
  has_secure_password
  validates :first_name, presence: true, length: {maximum: 100}
  validates :email, presence: true, uniqueness: true
  validates :zipcode, presence: true

  def get
    self.gifts.find_by(type_id: 2)
  end

  def give
    self.gifts.find_by(type_id: 1)
  end
end
