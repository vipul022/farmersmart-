class ListingsController < ApplicationController
  # Allow users to view index, show and search page only if they are not signed in
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_listing, only: [:show,  :edit, :update, :destroy]
  before_action :set_categories_and_munits, only: [:new, :edit, :create]

  # this will load the code in the ability model(cancancan)
  load_and_authorize_resource

  def search
    # search method will allow users to search for a listing by it's title
    if params[:q].blank?

      flash[:alert] = "Field cannot be left blank"
      redirect_to root_path
    else
      @params = params[:q].downcase

      @listings_found = Listing.where("lower(title) LIKE?", "%" + "#{@params}" + "%")

    end
  end

  def index
    # show all listings
    @listings = Listing.all
  end

  def create
    # create a listing for current user
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
    # show a single listing
  end

  def edit
  end

  def update
    # update the current listing
    @listing.update(listing_params)
    redirect_to @listing
  end

  def destroy
    # deleted current listing
    @listing.destroy
    redirect_to listings_path
  end

  private

  # Find the listing from database with matching id and store that in a variable
  def set_listing
    id = params[:id]
    @listing = Listing.find(id)
  end

  # Store all categories and measurement units in variables so that they can be used in creating drop downs in form partial
  def set_categories_and_munits
    @categories = Category.all
    @munits = Munit.all
  end

  # strong parameters allow user to create listing with explicitly permitted parameters
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :quantity, :category_id, :munit_id, :photo)
  end
end
