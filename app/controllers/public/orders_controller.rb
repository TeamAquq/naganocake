class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
  end

		@cart_items=current_customer.cart_items

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

     if params[:order_address] == "option1"
			@order.zip_code = current_customer.zip_code
			@order.address = current_customer.address
			@order.name = current_customer.last_name + current_customer.first_name
		elsif params[:order_address] == "option2"
			@address = Address.find(params[:order][:select_address])
			@order.address = @address.address
			@order.name = @address.name
			@order.zip_code = @address.zip_code
		elsif params[:order_address] == "option3"
		end
  end

  def finish
  end

  def index
  end

  def show
  end
end
