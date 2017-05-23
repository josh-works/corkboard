class SessionsController < ApplicationController

  def new
  end

  def create
    user = oauth_info ? oauth_login(User.locate_by(oauth_info, true)) : manual_login(User.locate_by(params[:session][:email]))
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def oauth_info
    request.env["omniauth.auth"]
  end

  def oauth_login(user)
   if user && user.new_record?
     render :template => "oauth/new", locals: { omniauth_info: oauth_info, user: User.new, name: User.name_from_oauth(oauth_info) }
   else
     session[:user_id] = user.id
     ConfirmationSender.send_confirmation_to(user)
     redirect_to twilio_confirmation_path
   end
  end

  def manual_login(user)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      ConfirmationSender.send_confirmation_to(user)
      redirect_to twilio_confirmation_path
    else
      flash.now[:failure] = user.errors.full_messages
      render :new
    end
  end
end
