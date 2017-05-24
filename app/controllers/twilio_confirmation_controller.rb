class TwilioConfirmationController < ApplicationController

  def new

  end

  def create
    if current_user.is_valid_code?(params[:code_verification][:code])
      session[:authenticated] = true
      flash["success"] = "Logged in as #{current_user.full_name}."
      user_redirect(current_user)
    else
      flash.now[:danger] = "The code you entered was not valid."
      render :new
    end
  end

  private

  def user_redirect(user)
    if user.type
      redirect_to pro_dashboard_path
    else
      redirect_to profile_dashboard_path
    end
  end

end
