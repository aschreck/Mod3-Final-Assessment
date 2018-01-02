class BestBuyService

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |f|
    f.request  :url_encoded             
    f.adapter  Faraday.default_adapter  
    end 
  end

  def get_json(url)
    response = @conn.get(url)
    JSON.parse(response.body)
  end

  def create_stores(json_stores)
    json_stores.map do |json_store|
      Store.new(json_store)
    end
  end
end 