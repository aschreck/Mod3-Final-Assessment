require 'bestbuy_service'

class SearchController < ActionController::Base

  def index
    service = BestBuyService.new
    json_stores = service.call_api(params["search"])
   # json_stores = service.get_json("stores(area(#{params["search"]},25))?format=json&show=storeType,city,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")["stores"]
    @stores = service.create_stores(json_stores)
  end 
end 