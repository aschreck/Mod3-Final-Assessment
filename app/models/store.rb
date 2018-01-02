class Store 
  def initialize(info)
    require 'pry'; binding.pry
    
    @name = info["longName"] 
    @city = info["city"]
    @type = info["storeType"] 
    @phone = info["phone"] 
    @distance = info["distance"] 
  end
end 