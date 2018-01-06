class Store 
  attr_reader :name, :city, :type, :phone, :distance
  def initialize(info)
    @name = info["longName"] 
    @city = info["city"]
    @type = info["storeType"] 
    @phone = info["phone"] 
    @distance = info["distance"] 
  end

  def self.all_by_zip(zip)
    json_stores = bestbuy(zip).stores_by_zip
    create_stores(json_stores)
  end 
  
  def self.create_stores(json_stores)
    json_stores.map do |json_store|
      Store.new(json_store)
    end
  end

  private 

    def self.bestbuy(filter)
      BestbuyService.new(filter)
    end 
end 