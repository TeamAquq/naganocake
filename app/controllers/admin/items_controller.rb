class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item =Item.find(params[:id])
    @genre = Genre.all
  end
  
  def create
   @item = Item.new(item_params)
   @genres = Genre.all
    if @product.save
      flash[:notice] = "You have created product successfully"
      redirect_to admin_product_path(@product.id)
    else
      render :new
    end
  end
  
  def update
   @item = Item.find(params[:id])
   @genres = Genre.all
   @item.update(item_params)
   if @product.update(product_params)
    flash[:notice] = "You have updated product successfully."
    redirect_to admin_product_path(@product)
   else
    render :edit
   end
  end
  
  private
  def item_params
   params.require(:item).permit(:name, :body, :genre_id, :price, :image, :sale_status)
  end
end
