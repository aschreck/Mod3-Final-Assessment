class BestbuyService

  def initialize(filter)
    @filter = filter || {}
    @conn = Faraday.new(:url => 'https://api.bestbuy.com') do |f|
    f.adapter  Faraday.default_adapter  
    end 
  end

  def stores_by_zip
    response = conn.get do |req|
      req.url("/v1/stores(area(#{filter},25))")
      req.params["apiKey"] = ENV["best_buy_key"]
      req.params["format"] = "json"
      req.params["show"]   = "storeType,city,longName,distance,phone"
    end 
    JSON.parse(response.body)["stores"]
  end 

  private 
    attr_reader :conn, :filter
end 