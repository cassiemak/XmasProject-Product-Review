class Review < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :product

  validates :mesage, :presence => true
  
end
