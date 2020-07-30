class Listing < ApplicationRecord
  #Listing associations
  belongs_to :category
  belongs_to :munit
  belongs_to :user
  #validations for listings
  validates :title, :price, :quantity, :munit, presence: true
  #This will allow user to attach a photo to each listing
  has_one_attached :photo
  
  has_many :cart_listings
  has_many :carts, through: :cart_listings



end


