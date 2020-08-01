class Listing < ApplicationRecord
  #Listing associations
  belongs_to :category
  belongs_to :munit
  belongs_to :user
  #validations for listings
  validates :title, :price, :quantity, :munit, presence: true
  #This will allow user to attach a photo to each listing
  has_one_attached :photo
  #set up many to many relation between listing and cart through join table
 
  #listing cannot be deleted alone as it is referenced in join table as well, this will delete the listing's record from join table and will leave no orphaned record 
  has_many :cart_listings, dependent: :destroy
  has_many :carts, through: :cart_listings



end

#listing.carts
# [#<Cart id: 3, completed: false, created_at: "2020-07-30 07:53:45", updated_at: "2020-07-30 07:53:45", user_id: 4>]>

#user.listings
# [#<Listing id: 13, title: "Eggplant", description: "Very healthy!", photo: nil, price: 2, quantity: 4, created_at: "2020-07-30 02:33:52", updated_at: "2020-07-30 02:33:52", category_id: 1, munit_id: 1, user_id: 4>, #<Listing id: 14, title: "grapes", description: nil, photo: nil, price: 2, quantity: 20, created_at: "2020-07-30 07:30:10", updated_at: "2020-07-30 07:30:10", category_id: 1, munit_id: 1, user_id: 4>]>
#cart.listings
# [#<Listing id: 14, title: "grapes", description: nil, photo: nil, price: 2, quantity: 20, created_at: "2020-07-30 07:30:10", updated_at: "2020-07-30 07:30:10", category_id: 1, munit_id: 1, user_id: 4>]>