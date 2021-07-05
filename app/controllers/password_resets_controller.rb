class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
          PasswordMailer.with(user: @user).reset.deliver_now
        else

        end
        redirect_to root_path, notice: "We have sent the reset link to your email if your email existed first."
    end
    def edit
      @user = User.find_signed(params[:user], purpose:"password_reset")
    end

end