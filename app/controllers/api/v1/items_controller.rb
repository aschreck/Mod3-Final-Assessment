class Api::V1::ItemsController < ActionController::API

  def index
    render json: Item.all, each_serializer: ItemSerializer
  end 

  def show
    
  end

  def destroy
    
  end

  def create
    
  end
end 
