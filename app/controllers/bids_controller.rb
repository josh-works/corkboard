class BidsController < ApplicationController

  def create
    # link to in whatever page will post to this action, so scope params to the requester and pro
    # find a way to uniquely identify this chatroom
  end

  def show
    @bid = Bid.find(params[:id])
    @message = Message.new
  end

end
