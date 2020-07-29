class UsersController < ApplicationController

  def show
  #search for a particular user in database 
      @user = User.find(params[:id])
  #search all the listings for a particular user to display is user's show page    
      @user_listings = @user.listings
      p "********"
      p @user_listings
  end
end

