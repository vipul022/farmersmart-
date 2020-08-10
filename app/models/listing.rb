class Listing < ApplicationRecord
  # Listing associations
  belongs_to :category
  belongs_to :munit
  belongs_to :user
  # validations for listings
  validates :title, :price, :quantity, :munit, :category, presence: true
  # This will allow user to attach a photo to each listing
  has_one_attached :photo
  # set up many to many relation between listing and cart through join table

  # listing cannot be deleted alone as it is referenced in join table as well, this will delete the listing's record from join table and will leave no orphaned record
  has_many :cart_listings, dependent: :delete_all
  has_many :carts, through: :cart_listings
end
