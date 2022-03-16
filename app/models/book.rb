class Book < ApplicationRecord
  validates :book_name, presence:true
  validates :book_price, presence:true
  belongs_to :author
  has_many :images, as: :imageable, dependent: :destroy
end
