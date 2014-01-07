class HomeController < ApplicationController

  def index
  end

  def wow
    query = {}

    if params[:query]
      query = ActiveSupport::JSON.decode(params[:query]).symbolize_keys
    end

    text = DogeIpsum::Wow.generate(query)

    render json: text
  end

end