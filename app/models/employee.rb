class Employee < ApplicationRecord
validates :emp_first_name, :emp_last_name, presence: true
validates :email, confirmation: true , format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true, presence:true
validates :age, presence: true, numericality: true, comparison: { greater_than: 18 , message: "Employee must be atleast 18 years old"}
validates :salary, :no_of_order, numericality: true, presence: true
end
