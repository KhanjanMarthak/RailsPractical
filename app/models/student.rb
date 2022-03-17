class Student < ApplicationRecord
  validates :stud_first_name, :stud_last_name, presence: true
  validates :stud_dob, comparison: { less_than: Date.today+1, message: "birthdate can't be in future" }
  validates :department, inclusion: {in: %w(IT CP), message: "Department can't be %{value}, It has to be IT or CP"}
  validates :term_of_service, acceptance: true, presence: { message: "You cannot proceed without accepting Terms of Usage" }
end
 