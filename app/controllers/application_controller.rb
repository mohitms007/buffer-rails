class ApplicationController < ActionController::Base

    before_action :set_current_user
    

    def set_current_user
        if session[:user_id]
            Current.user = User.find(session[:user_id])
        end 
    end

    def require_user_logged_in
        redirect_to sign_in_path, alert: 'You need to sign in first.' if Current.user.nil?
    end
end