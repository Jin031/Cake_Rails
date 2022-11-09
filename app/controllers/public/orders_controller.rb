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
    @cart_items =
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
   if params[:order][:select_address] ='0'
    @order.postal_code =  current_customer.postal_code
    @order.address =  current_customer.address
    @order.name = current_customer.name
   elsif params[:order][:select_address] ='1'　
    
   else 
     
   end
  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :status, :payment_method, :delivery_charge)
  end
end
