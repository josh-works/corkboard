class Api::V1::AutocompleteController < ApplicationController

  def index
    matches = Service.render_autocomplete(params[:q]) + Category.render_autocomplete(params[:q])
    count = matches.count
    matches = matches[0..9]
    matches += [{label: "There are #{count} possible matches!"}]
    render json: matches
  end
end
