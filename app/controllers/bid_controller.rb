class BidController < ApplicationController
  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.create(bid_params)
    @bid.pro = Pro.find(current_user.id)
    @bid.project = Project.find(params[:project_id])

    if @bid.save
      if params[:bid][:attachments_attributes]
        @bid.attachments.create(upload: params[:bid][:attachments_attributes]["0"][:upload])
      end
      flash["success"] = bid_placed
      redirect_to new_charge_path
    else
      flash.now[:danger] = @bid.errors.full_messages
      render '/pro_dashboard/open_projects/show'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :comment, :project_id)
  end

end
