module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "pMate"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    redirect_to signin_path, :notice=> "You need to be signed in to access that content!"
  end


end

