class CreateAqproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :aqproducts do |t|
      t.string :title
      t.string :description
      t.integer :capacity
      t.boolean :is_active
      t.integer :status
      t.timestamps
    end
  end
end
