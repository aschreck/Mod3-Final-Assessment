class SearchController < ActionController::Base

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params["search"]},25))?format=json&show=storeType,city,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")
    json_stores = JSON.parse(response.body)["stores"]
    @stores = []
    
    json_stores.each do |json_store|
      @stores << Store.new(json_store)
    end
  end 

end 