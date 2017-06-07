class ChargesController < ApplicationController
  def new
    
  end

  def create
    @bid = Bid.create(amount:"78", comment: "good", project_id: 122)
    

    charge = Stripe::Charge.create(
      
      amount: 200,
      description: "Good charge",
      currency: "USD",
      source: params[:stripeToken]
      )    
      if charge.save
        redirect_to pro_dashboard_open_projects_path
      else
        redirect_to new_charge_path
      end
  end
end
