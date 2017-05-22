class ProRegisterController < ApplicationController

  def new
    @service = Service.find(params[:service])
    @pro = Pro.new
  end

  def create
    @pro = Pro.new(pro_params)
    if @pro.save
      session[:pro_id] = @pro.id
      flash["success"] = "Logged in as #{@pro.full_name}."
      redirect_to pro_dashboard_path
    else
      flash.now[:failure] = @pro.errors.full_messages
      render :new
    end
  end

  private

  def pro_params
    params.require(:pro).permit(:first_name,
                                 :last_name,
                                 :zipcode,
                                 :phone_number,
                                 :email,
                                 :uid,
                                 :password,
                                 :password_confirmation)
  end
end
