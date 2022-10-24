class Admin::CustomersController < ApplicationController
 def index
  @customers = Customer.all.page(params[:page])
 end

 def show
  @customer = Customer.find(params[:id])
 end

 def edit
  @customer = Customer.find(params[:id])
 end

 def update
  @customer = Customer.find(params[:id])
 end

 private

 def customer_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
 end

end
