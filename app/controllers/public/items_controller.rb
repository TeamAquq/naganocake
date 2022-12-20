class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
  
 private
 def item_params
   params.require(:item).permit(:name, :body, :price, :image, :sale_status)
 end
end