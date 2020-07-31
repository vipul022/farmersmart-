class CartsController < ApplicationController
#this action will store all the listings that have been added to cart by current user in a variable that will be used in html view.  
  def index
    if user_signed_in? && current_user.cart
      @cart_listings = current_user.cart.listings
    else
      redirect_to listings_path
    end
  end

  def create
  end

end
