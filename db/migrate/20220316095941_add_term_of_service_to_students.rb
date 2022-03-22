class AddTermOfServiceToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :term_of_servie, :string
  end
end
