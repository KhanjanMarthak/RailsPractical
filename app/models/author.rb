class Author < ApplicationRecord
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_many :books, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
end
