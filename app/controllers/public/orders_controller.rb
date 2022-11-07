class Public::OrdersController < ApplicationController
  def new
   @order =  Order.new
  end

  def create

  end

  def index

  end

  def show

  end

  def complete

  end

  def confirm

  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address)
  end
end
