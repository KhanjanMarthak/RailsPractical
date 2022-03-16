class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :fac_first_name
      t.string :fac_last_name
      t.date :fac_dob
      t.string :email
      t.integer :phone_number
      t.string :designation
      t.timestamps
    end
  end
end
