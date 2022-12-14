class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index #注文履歴一覧画面
     @orders = Order.all
  end

  def current_user_order
    @orders = Order.where(customer_id: params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update #注文ステータス更新
    @order = Order.find(params[:id])
    @order.update(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :price, :order_status)
  end
end
