class Category < ApplicationRecord
  # Category model relation with listings
  has_many :listings
end
