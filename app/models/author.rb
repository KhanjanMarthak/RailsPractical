class Author < ApplicationRecord
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } 
end
