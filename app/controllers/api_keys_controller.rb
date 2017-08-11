class ApiKeysController < ApplicationController
 
  def show
    create
    @token = ApiKey.last.access_token
  end

  def create
    @token = ApiKey.create!
  end

end
