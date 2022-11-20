# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 before_action :configure_permitted_parameters, if: :devise_controller? 
 before_action :customer_state, only: [:create]
   def after_sign_in_path_for(resource)
    about_path
   end

   def after_sign_out_path_for(resource)
    root_path
   end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  if (@customer.valid_password?(params[:customer][:password])) && (@customer.is_deleted == false)
    customers_path
  else
   redirect_to new_customer_registration_path
  end
end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
