class BestbuyService

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |f|
    f.request  :url_encoded             
    f.adapter  Faraday.default_adapter  
    end 
  end

  def stores_by_zip(zipcode)
    call_api(zipcode)["stores"]
  end 

  def call_api(zipcode)
    url = "stores(area(#{zipcode},25))?format=json&show=storeType,city,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}"
    get_json(url)
  end 

  private 
    
    attr_reader :conn
    def get_json(url)
      response = @conn.get(url)
      JSON.parse(response.body)
    end
end 