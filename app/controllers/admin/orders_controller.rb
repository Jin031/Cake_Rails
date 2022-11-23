class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
   @order = Order.find(params[:id])
   @order_ditail = OrderDitail.find(params[:id])

  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to  admin_order_path
  end

  private
  def order_params
      params.require(:order).permit(:status)
  end
end