class CartsController < ApplicationController
#this action will store all the listings that have been added to cart by current user in a variable that will be used in html view.  
  def index
    if user_signed_in? && current_user.cart
      @cart_listings = current_user.cart.listings
      p "@@@@@@@"
      pp @cart_listings
      
    else
      redirect_to listings_path
    end
    @total_cost   = total_cost
  end
# if user's cart is empty, a cart can be created for the user and the completed status is set to false,in case user is already having a cart and when user click on add to cart link on the listing, the listing can be added to the cart
  def create
      if !current_user.cart
        cart = Cart.create(completed: false, user_id: current_user.id)
      else
        cart = current_user.cart
    # p "/////////"
      # p cart.listings
       
      end
    # p "/////////listing"
      # p params[:listing_id]
      listing = Listing.find(params[:listing_id])
      cart.listings << listing
      # p "@@@@@@@"
      # pp listing
      redirect_to carts_path
  end

  private

  def total_cost
    count = 0
    @cart_listings.each do |listing|
      count+=listing.price
    end
    return count
  end

end
