class ListingsController < ApplicationController
  #This will allow users to view index and show page only if they are not signed in
  before_action :authenticate_user!, except: [:index, :show]

  def index
      #show all listings
      @listings = Listing.all
  
  end

  def create
      #create a listing for current user
        @listing = current_user.listings.create(listing_params)

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
  # strong parameters allow user to create listing with explicitly permitted parameters
  def listing_params
      params.require(:listing).permit(:title, :description, :price, :quantity, :category_id, :munit_id, :photo)

  end
end
