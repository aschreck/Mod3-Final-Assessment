class BestbuyService

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |f|
    f.request  :url_encoded             
    f.adapter  Faraday.default_adapter  
    end 
  end

  def stores_by_zip(zipcode)
    json_stores = call_api(zipcode)
    create_stores(json_stores)
  end 
  
  def create_stores(json_stores)
    json_stores.map do |json_store|
      Store.new(json_store)
    end
  end
  
  def call_api(zipcode)
    get_json("stores(area(#{zipcode},25))?format=json&show=storeType,city,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")["stores"]
  end 

  private 
    
    attr_reader :conn
    def get_json(url)
      response = @conn.get(url)
      JSON.parse(response.body)
    end
end 