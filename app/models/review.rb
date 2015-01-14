class Review < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :product

  validates :message, :presence => true

  # you need to define what spam_free is before you can use it
  # this is a custom validator
  # validates :spam_free

  # private

  # def spam_free
    
  # end

end
