class UsersController < ApplicationController
  def new
    @title = "Create a User"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      
      flash[:success] = "Welcome to pMate!"
      
      sign_in @user #you can find this in the sessions_helper
      
      
      redirect_to @user

    else
      @title = "Create a User"
      render 'new'
    end
  end


  def edit
    @title = "Edit User"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.first_name + " " + @user.last_name
  end

end
