class BidsController < ApplicationController

  def show
    binding.pry
    @bid = Bid.find_by(slug: params[:slug])
    @message = Message.new
  end

end
