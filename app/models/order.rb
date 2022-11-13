class Order < ApplicationRecord
 belongs_to :customer
 has_many :order_ditails, dependent: :destroy
enum payment_method: { credit_card: 0, transfer: 1 }
 def subtotal
    item.with_tax_price * amount
 end
end
