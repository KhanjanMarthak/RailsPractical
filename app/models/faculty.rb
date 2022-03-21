class Faculty < ApplicationRecord
  validates :fac_first_name, :fac_last_name, presence: true
  validates :fac_dob, comparison: { less_than: Date.today, message: "birthdate can't be in future" }
  validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true, presence: true
  validates :designation, inclusion: {in: %w(Asst.Prof Prof), message: "can't be %{value}, it has to be Asst.Prof or Prof "}
  validates :designation, exclusion: {in: %w(HOD Sr.Prof), message: "designation can't be HOD or Sr.Prof "}
  validates :phone_number, :presence => true, :numericality => true,  :length => { :is=>10, message: "should be 10 Digit Mobile Number" }
end
