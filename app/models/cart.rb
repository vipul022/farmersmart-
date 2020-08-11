class Cart < ApplicationRecord
#set up many to many relation between listings and carts through join table
  has_many :cart_listings, dependent: :delete_all
  has_many :listings, through: :cart_listings
  belongs_to :user
end
