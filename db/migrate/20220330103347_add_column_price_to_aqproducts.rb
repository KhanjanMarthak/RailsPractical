class AddColumnPriceToAqproducts < ActiveRecord::Migration[7.0]
  def change
    add_column :aqproducts, :price, :integer
  end
end
