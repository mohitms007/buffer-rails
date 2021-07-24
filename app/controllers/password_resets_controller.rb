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
      @user = User.find_signed!(params[:user], purpose:"password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your Token has expired, please try again."
    end

    def update
      @user = User.find_signed!(params[:user], purpose:"password_reset")
      if @user.update(password_resets)
        redirect_to sign_in_path, notice: "Your password was reset successfully, Please Sign in."
      else
        render :edit
      end
    end 
    private

    def password_params
      params.require(:user).permit(:password,:password_confirmation)
    end
end