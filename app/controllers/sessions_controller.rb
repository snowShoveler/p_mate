class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end

  def create
    
    if request.post?
      user = User.authenticate(params[:session][:email],
                              params[:session][:password])
      if user.nil?
        # oooops nobody there

        flash.now[:error] = "Invalid email and password combination"
        
        @title = "Sign In"
        render 'new'
        
      else
        #someone there

        sign_in user

        redirect_to user
        flash[:success] = "Hi there #{current_user.full_name}!"
        
      end
    end
  end

  def destroy
    
    sign_out
    redirect_to root_path

  end
end
