class Api::V1::ItemsController < ActionController::API

  def index
    render json: Item.all, each_serializer: ItemSerializer
  end 

  def show
    item = Item.find(params[:id])
    render json: item, serializer: ItemSerializer
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def create
    
  end
end 
