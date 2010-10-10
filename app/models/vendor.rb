class Vendor < ActiveRecord::Base
  HUMANIZED_ATTRIBUTES = {
    :cell_number=>"Cell number",
    :office_phone=>"Office phone",
    :name=>'Company name'
  }

  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end 
has_many :stock_vendor_details
    
  validates_presence_of     :name
  validates_uniqueness_of   :name
  validates_format_of       :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i 
  validates_numericality_of :cell_number,:office_phone, :allow_blank=>true 
 
 
 
end
