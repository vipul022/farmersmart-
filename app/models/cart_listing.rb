class CartListing < ApplicationRecord
#CartListing model relations 
  belongs_to :cart
  belongs_to :listing
end
