class ProController < ApplicationController
  def show 
    @pro = Pro.find(current_user.id)
  end

  def new
    @services = Service.where(id: params[:service_id])
    session[:service_ids] = Service.pro_service_ids(params[:service_id])
    @pro = Pro.new
  end

  def create
    @pro = Pro.new(pro_params)
    @pro.create_pro_service[:service_ids] = session[:service_ids]
    if @pro.save
      session[:user_id] = @pro.id
      session.delete(:service_ids)
      flash["success"] = "Logged in as #{@pro.full_name}."
      redirect_to pro_dashboard_path
    else
      flash.now[:danger] = @pro.errors.full_messages
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
