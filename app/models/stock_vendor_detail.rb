class StockVendorDetail < ActiveRecord::Base
belongs_to :vendor
belongs_to :stock
end
