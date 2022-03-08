class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.integer :team_size
      t.integer :charges
      t.timestamps
    end
  end
end
