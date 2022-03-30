class Order < ApplicationRecord
  belongs_to :aqproduct 
  belongs_to :customer
  enum :status, [:booked, :cancelled]
end
