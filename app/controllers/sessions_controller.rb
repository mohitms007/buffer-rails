class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged In Successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end


    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged Out"
        redirect_to root_path, notice: "Logged Out"
    end


end