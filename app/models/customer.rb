class Customer < ApplicationRecord
  validates :email, confirmation: true , format: { with: URI::MailTo::EMAIL_REGEXP }, presence:true, uniqueness: true
  validates :phone, numericality: true
  has_many :orders, dependent: :destroy
end
