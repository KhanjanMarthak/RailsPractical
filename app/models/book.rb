class Book < ApplicationRecord
    validates :book_name, presence:true
    validates :book_price, presence:true
    belongs_to :author
    has_many :image
end
