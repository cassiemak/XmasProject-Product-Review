class Review < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :product

  validates :message, :presence => true
  
end
