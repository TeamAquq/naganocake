class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new #注文情報入力画面
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def show #なかったので追加しました
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end


  def confirm #注文情報確認画面
    @order = Order.new(order_params)
    #@order.customer_id = current_customer.id　　面倒くさかったので全部消してます

    if params[:order_address] == "option1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order_address] == "option2"
      @address = Address.find(params[:order][:address_id])#[address]→[address_id]
      @order.address = @address.address
      @order.name = @address.name
      @order.postcode = @address.postcode
    elsif params[:order_address] == "option3"
    end

    @cart_items = current_customer.cart_items
    @total_payment = 0
    #@cart_items.each do |cart_item|
     #@total_payment = @order.fare + cart_item.subtotal
    #end

  end

  def create
    @order = Order.new(order_params)
    @order.fare = 800
    @order.order_status = 0
    @order.save!

    current_customer.cart_items.each do |cart_item| #注文詳細内容の保存
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.tax_price = cart_item.item.price*1.1 #@order_item.priceになってました
      @order_item.quanity = cart_item.quantity #dbが間違っているのでquanityにしてます
      @order_item.creat_status = 0 #追加しました
      @order_item.save
    end

    current_customer.cart_items.destroy_all
    redirect_to finish_orders_path
  end

  def finish
  end

  def index
    @orders = current_customer.orders
  end

  def complete
    @orders = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

    def order_params
	    params.require(:order).permit(:customer_id, :pay_method, :total_price, :postcode, :address, :name)
    end

end
