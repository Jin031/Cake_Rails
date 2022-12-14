class Order < ApplicationRecord
 belongs_to :customer
 has_many :order_ditails, dependent: :destroy
enum payment_method: { credit_card: 0, transfer: 1 }
enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_for_shipment: 3, shipped: 4 }
 def subtotal
    item.with_tax_price * amount
 end
end
