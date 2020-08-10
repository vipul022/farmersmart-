class CartsController < ApplicationController
  def index
    # this action will store current user's cart  in a variable tha is used in html view.

    if user_signed_in? && current_user.cart
      @cart = current_user.cart

    else

      redirect_to listings_path
    end
  end

  # if user's cart is empty, a cart can be created for the user and the completed status is set to false,in case user is already having a cart and when user click on add to cart link on the listing, the listing can be added to the cart
  def create
    if !current_user.cart
      cart = Cart.create(completed: false, user_id: current_user.id)

    else
      cart = current_user.cart
    end

    listing = Listing.find(params[:listing_id])

    cart.listings << listing

    redirect_to carts_path
  end

  def destroy
    cart = current_user.cart

    cart.cart_listings.delete(params[:id])
    cart.save
    redirect_to carts_path
  end
end
