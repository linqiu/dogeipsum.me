class HomeController < ApplicationController

  def index
  end

  def wow
    query = {}
    if params[:query]
      query = params[:query].each.inject({}) do |sum, pair| 
        sum[pair.first.to_sym] = pair.last.to_i
        sum
      end
    end

    text = DogeIpsum::Wow.generate(query)

    render json: text
  end

end