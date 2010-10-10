class BillingEntry < ActiveRecord::Base
has_many :billing_details
validates_presence_of :user_id
belongs_to :user
belongs_to :admin
after_create :generate_receipt_number
 
 
 
 def generate_receipt_number
  string_for_code=self.id.to_s
  if string_for_code.length<3
    if string_for_code.length==2
      string_for_code="0"+string_for_code
    else
    string_for_code="00"+string_for_code
    end
  end
  self.receipt_number="BN" + string_for_code
  self.save
   
  end
  
  
end
