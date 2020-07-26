class ListingsController < ApplicationController
  #This will let all the users to view index and show page only
  before_action :authenticate_user!, except: [:index, :show]

  def index
  
  end

  def create
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # strong parameters allow user to create listing with explicitly permitted parameters
  def listing_params
      params.require(:listing).permit(:title, :description, :price, :quantity, :category_id, :munit_id, :photo)

  end
end
