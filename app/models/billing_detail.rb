class BillingDetail < ActiveRecord::Base
belongs_to :billing_entry
belongs_to :stock

end
