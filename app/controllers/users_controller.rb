class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      ConfirmationSender.send_confirmation_to(@user)
      session[:user_id] = @user.id
      flash["success"] = "Logged in as #{@user.full_name}."
      redirect_to twilio_confirmation_path
    else
      flash.now[:failure] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :zipcode,
                                 :phone_number,
                                 :email,
                                 :uid,
                                 :password,
                                 :password_confirmation)
  end

  def twilio_params
    params.require(:user).permit(:email, :phone_number)
  end
end
