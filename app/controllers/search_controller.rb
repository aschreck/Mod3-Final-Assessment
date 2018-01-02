class SearchController < ActionController::Base

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params["search"]},25))?format=json&show=storeType,city,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")
    stores = JSON.parse(response.body)
    require 'pry'; binding.pry
      
  end 

end 