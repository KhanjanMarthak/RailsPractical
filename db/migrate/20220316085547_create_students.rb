class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :stud_first_name
      t.string :stud_last_name
      t.string :department
      t.date :stud_dob
      t.timestamps
    end
  end
end
