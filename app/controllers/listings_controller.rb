class ListingsController < ApplicationController
  # Allow users to view index and show page only if they are not signed in
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy] 
  before_action :set_categories_and_munits, only: [:new, :edit, :create]
  def index
      #show all listings
      @listings = Listing.all
  
  end

  def create
      #create a listing for current user
        @listing = current_user.listings.create(listing_params)
        p "**********"
        p params

        if @listing.errors.any?
            render "new"
        else
            redirect_to @listing
        end
  end

  def new
      @listing = Listing.new
  end

  def show
      #show a single listing
  end

  def edit
  end

  def update
      #update the current listing
      @listing.update(listing_params)
      redirect_to @listing
  end

  def destroy
      #deleted current listing
      @listing.destroy
      redirect_to listings_path
  end

  private
  # Find the listing from database with matching id and store that in a variable
  def set_listing
      id = params[:id]
      @listing = Listing.find(id)
  end
  #Store all categories and measurement units in variables so that they can be used in creating drop downs in form partial
  def set_categories_and_munits
        @categories = Category.all
        @munits = Munit.all
  end

  # strong parameters allow user to create listing with explicitly permitted parameters
  def listing_params
      params.require(:listing).permit(:title, :description, :price, :quantity, :category_id, :munit_id, :photo)

  end
end

# <ActionController::Parameters {"authenticity_token"=>"8LcaG8qCJF8y7n/xMq3fH8XaiVkSl5FBRw+1S8Tx/KF2Y+zSY7bWER3nX77v7B/PyT50B7BVIaB7vmK3s1TMqA==", "listing"=><ActionController::Parameters {"title"=>"Carrot", "price"=>"2", "quantity"=>"4", "category_id"=>"1", "munit_id"=>"1", "description"=>"Very fresh"} permitted: false>, "commit"=>"Create Listing", "controller"=>"listings", "action"=>"create"} permitted: false>