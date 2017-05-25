class BidController < ApplicationController
  def create
    @bid = Bid.new(bid_params)
    @bid.pro = Pro.find(current_user.id)
    @bid.project = Project.find(params[:project_id])

    if @bid.save
      flash["success"] = bid_placed
      redirect_to pro_dashboard_project_bids_path
    else
      flash.now[:danger] = @bid.errors.full_messages
      render '/pro_dashboard/open_projects/show'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :comment)
  end

end
