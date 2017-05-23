class UsersController < ApplicationController
  before_filter :omniauth_user


  def new
    @user = User.new
    render_form if omniauth_user
  end

  def create
    @user = User.new(user_params)
    @user.uid = session[:omniauth_info]['uid'] if omniauth_user
    if @user.save
      ConfirmationSender.send_confirmation_to(@user)
      session[:user_id] = @user.id
      flash["success"] = "Logged in as #{@user.full_name}."
      session.delete(:omniauth_info)
      redirect_to twilio_confirmation_path
    else
      flash.now[:danger] = @user.errors.full_messages
      render_form
    end
  end

  private

  def render_form
    if omniauth_user
      render :template => "oauth/new", locals: { name: User.name_from_oauth(@omniauth_info) }
    else
      render :new
    end
  end

  def omniauth_user
    @omniauth_info ||= session[:omniauth_info] if session[:omniauth_info]
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :zipcode,
                                 :phone_number,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
