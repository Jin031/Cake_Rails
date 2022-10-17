class CreateOrderDitails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_ditails do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :making_status, null: false, default: 0
      t.integer :amount, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
