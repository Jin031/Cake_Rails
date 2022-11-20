class OrderDitail < ApplicationRecord
 belongs_to :order
 belongs_to :item
 enum making_status: { not_allowed_to_produce: 0, production_waiting: 1, in_production: 2, production_completed: 3 }
end
