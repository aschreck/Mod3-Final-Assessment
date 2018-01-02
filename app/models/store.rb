class Store 
  attr_reader :name, :city, :type, :phone, :distance
  def initialize(info)
    @name = info["longName"] 
    @city = info["city"]
    @type = info["storeType"] 
    @phone = info["phone"] 
    @distance = info["distance"] 
  end
end 