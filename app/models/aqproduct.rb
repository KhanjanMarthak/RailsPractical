class Aqproduct < ApplicationRecord
  default_scope { where(is_active: true) }
  enum :status, [:in_stock, :out_of_stock, :coming_soon]
  has_many :orders, dependent: :destroy
end
