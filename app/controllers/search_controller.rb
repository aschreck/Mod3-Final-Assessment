require 'bestbuy_service'

class SearchController < ActionController::Base

  def index
    service = BestBuyService.new
    json_stores = service.get_json("stores(area(#{params["search"]},25))?format=json&show=storeType,city,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")["stores"]
    @stores = service.create_stores(json_stores)
    
    #response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params["search"]},25))?format=json&show=storeType,city,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")
    # json_stores = JSON.parse(response.body)["stores"]
    # @stores = []
    
    # json_stores.each do |json_store|
    #   @stores << Store.new(json_store)
    # end
  end 

end 