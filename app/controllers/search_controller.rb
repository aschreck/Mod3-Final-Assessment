require 'bestbuy_service'

class SearchController < ActionController::Base

  def index
    service = BestBuyService.new
    @stores = service.get_stores(params["search"])
  end 
end 