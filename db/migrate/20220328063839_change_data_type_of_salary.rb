class ChangeDataTypeOfSalary < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :salary, :integer
  end
end
