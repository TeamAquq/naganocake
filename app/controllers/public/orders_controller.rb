class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new #注文情報入力画面
    @order = Order.new
    @address = current_customer.address
  end

  def confirm #注文情報確認画面
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if params[:order_address] == "option1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order_address] == "option2"
      @address = Address.find(params[:order][:select_address])
      @order.address = @address.address
      @order.name = @address.name
      @order.postcode = @address.postcode
    elsif params[:order_address] == "option3"
    end
    
    @cart_items = current_customer.cart_items
    
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    
    current_customer.cart_items.each do |cart_item| #注文詳細内容の保存
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.tax_price = cart_item.tax_price
      @order_item.quantity = cart_item.quantity
      @order_item.save!
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_finish_path
  end

  def finish
  end

  def index
    @orders = current_customer.orders
  end

  def 
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  
  private

    def order_params
	    params.require(:order).permit(:customer_id, :pay_method, :total_price, :postcode, :address, :name)
    end
  
end
