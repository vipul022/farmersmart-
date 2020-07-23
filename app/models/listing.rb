class Listing < ApplicationRecord
  #Listing associations
  belongs_to :category
  belongs_to :munit
  belongs_to :user
end
