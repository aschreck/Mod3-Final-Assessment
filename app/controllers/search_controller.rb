class SearchController < ActionController::Base

  def index
    
    Faraday.get(https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType&apiKey=nysued5unnmfhft4bp5u6779)
  end 

end 