require 'bestbuy_service'

class SearchController < ActionController::Base
  def index
    @stores = Store.all_by_zip(params["search"])
  end 
end 