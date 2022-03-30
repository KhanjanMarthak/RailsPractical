class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :total_price
      t.integer :status
      t.integer :aqproduct_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
