class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!
  def new
   @order =  Order.new
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.save
   @cart_items = current_customer.cart_items
   @cart_items.each do |cart_item|
    order_ditail = OrderDitail.new
    order_ditail.order_id = @order.id
    order_ditail.item_id = cart_item.item.id
    order_ditail.amount = cart_item.amount
    order_ditail.price = cart_item.item.price
    order_ditail.save
   end
   current_customer.cart_items.destroy_all
   redirect_to complete_orders_path
  end

  def index
   @orders =  current_customer.orders
  end

  def show
   @order = Order.find(params[:id])
   @total = 0
   @order.order_ditails.each do |ditail|
   @total += ditail.item.with_tax_price * ditail.amount
   end
  end

  def complete
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.delivery_charge = 800
   if params[:order][:select_address] =='0'
    @order.postal_code =  current_customer.postal_code
    @order.address =  current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
   elsif params[:order][:select_address] =='1'
    @order.postal_code =  @address.postal_code
    @order.address =  @address.address
    @order.name = @address.name
   end
  end

  private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :total_payment, :status, :payment_method, :delivery_charge)
  end
end
