class Author < ApplicationRecord
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_many :books 
  has_many :image
end