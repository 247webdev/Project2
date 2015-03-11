class Gift < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, presence: true, length: {maximum: 100}
  validates :description, presence: true, length: {maximum: 500}


end
