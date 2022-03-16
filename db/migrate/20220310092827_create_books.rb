class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.decimal :book_price
      t.timestamps
    end
  end
end
