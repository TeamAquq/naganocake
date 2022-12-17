class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item =Item.find(params[:id])
    @genre = Genre.all
  end
  
  def create
   @items = Item.new(item_params)
   @genre = Genre.all
   @item.save
   redirect_to admin_item_path(@item.id)
  end
  
  def update
   @items = Item.find(params[:id])
   @genre = Genre.all
   @item.update(item_params)
   redirect_to admin_item_path(@item.id)
  end
  
  private
  def item_params
   params.require(:item).permit(:name, :body, :genre_id, :price, :image, :sale_status)
  end
end
