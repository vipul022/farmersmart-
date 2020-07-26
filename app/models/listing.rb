class Listing < ApplicationRecord
  #Listing associations
  belongs_to :category
  belongs_to :munit
  belongs_to :user
  #validations 
  validates :title, :price, :quantity, :munit, presence: true
end
