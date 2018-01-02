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
    item = Item.create(item_params)
    render json: item, serializer: ItemSerializer, status: 201
  end

  private 
    
  def item_params
    params.permit(:name, :description, :image_url)
  end 
end 
