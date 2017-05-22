class ProRegister::IndustryController < ApplicationController
  def index
    @industries = Industry.all
  end
end
