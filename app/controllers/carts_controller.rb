class CartsController < ApplicationController
#this action will store current user's cart  in a variable tha is used in html view.  
  def index
  
    if user_signed_in? && current_user.cart
      @cart = current_user.cart
      # p "@@@@@@@"
      # pp @cart_listings
      #  p "/////////listing"
      # p params[:listing_id]
      # p params
     
    else
     
      redirect_to listings_path
    end
    # @total_cost   = total_cost

  end
# if user's cart is empty, a cart can be created for the user and the completed status is set to false,in case user is already having a cart and when user click on add to cart link on the listing, the listing can be added to the cart
  def create
      if !current_user.cart
        cart = Cart.create(completed: false, user_id: current_user.id)

      else
        cart = current_user.cart
        # cart = current_user.cart
    # p "/////////"
      # p cart.listings
       
      end
      p "??????? cart"
      p cart
      # byebug
    p "///////// params listing"
      p params[:listing_id]
      listing = Listing.find(params[:listing_id])
      # listing = Listing.find(params[:id])
      cart.listings << listing
      # p "@@@@@@@ listing"
      # p params
      redirect_to carts_path
  end

  def destroy
    # byebug
    cart = current_user.cart
    p "params", params
    p "DESTROY params[:id]=> ", params[:id]
    # p "params[:listing_id]=> ", params[:listing_id]
    # cart.listings.delete(params[:id])
    #a = [1,2,3,4,5,6,7]
# b = a.delete(a.find{|n| n > 4}) 
#=> 5list

#=> [1,2,3,4,6,7]
  #  cart.listings.delete(cart.listings.find{ n})
    
      cart.cart_listings.delete(params[:id])  
      cart.save
      redirect_to carts_path
    
    
  end

  


end


