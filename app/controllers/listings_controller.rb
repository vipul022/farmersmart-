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
end
