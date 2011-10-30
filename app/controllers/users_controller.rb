class UsersController < ApplicationController
  def new
    @title = "Create a User"
  end

  def edit
    @title = "Edit User"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.first_name + " " + @user.last_name
  end

end