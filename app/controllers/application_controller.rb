class ApplicationController < ActionController::Base

    
   def set_current_user
    if session[:user_id]
        Current.user = User.find(session[:user_id])
    end 

end
