class Order < ApplicationRecord
  belongs_to :aqproduct 
  belongs_to :customer
  enum :status, [:booked, :cancelled]

  def self.search(search)
    if search
      findproduct= Aqproduct.find_by(title: search)
      if findproduct
        self.where(aqproduct_id: findproduct)
      else
        Order.none
      end
    else
      Order.none
    end
  end
end
