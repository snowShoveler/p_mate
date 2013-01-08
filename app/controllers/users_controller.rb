class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:edit, :update, :show]

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
    
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      @title="Edit User"
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @title = @user.first_name + " " + @user.last_name
  end

end
