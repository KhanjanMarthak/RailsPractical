class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :emp_first_name
      t.string :emp_last_name
      t.string :email
      t.integer :age
      t.integer :no_of_order
      t.string :full_time_available
      t.string :salary

      t.timestamps
    end
  end
end
