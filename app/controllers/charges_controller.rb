class ChargesController < ApplicationController
  def new

  end

  def create
    charge = Stripe::Charge.create(
      amount: 200,
      description: "Bid for a Corkboard project",
      currency: "USD",
      source: params[:stripeToken]
      )

    if charge.save
      flash["success"] = bid_placed
      redirect_to pro_dashboard_open_projects_path
    else
      flash.now[:danger] = charge_declined
      redirect_to new_charge_path
    end
  end
end
