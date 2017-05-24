class ProController < ApplicationController
  def show
    binding.pry
    @pro = Pro.find(current_user.id)
  end
end
