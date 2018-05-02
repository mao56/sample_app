class UsersController < ApplicationController
  def show
    #@user = User.first
    @user = User.find(params[:id])
    #debugger
  end
  
  def new
  end
end
