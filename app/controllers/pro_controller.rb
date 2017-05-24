class ProController < ApplicationController
  def show 
    @pro = Pro.find(current_user.id)
  end
end
