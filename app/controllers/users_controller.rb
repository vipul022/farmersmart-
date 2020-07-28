class UsersController < ApplicationController

  def show
  #search for a particular user in database 
      @user = User.find(params[:id])
  end
end