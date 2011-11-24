module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user=user
    
  end

  def current_user=(user)
    @current_user= user
  end

  def current_user
    if signed_in?
      @current_user ||= User.find(session[:user_id])
    end
    
  end

  def signed_in?
    !session[:user_id].nil?
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end



end
