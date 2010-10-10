class Member < ActiveRecord::Base
  belongs_to :user
   HUMANIZED_ATTRIBUTES = {
    :father_full_name => "Father full name",
    :mother_full_name => "Mother full name",
    :father_email => "Father Email address",
    :mother_email => "Mother Email address"
  }

  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end 
  
  
  
  validates_presence_of :father_full_name
  validates_presence_of :mother_full_name
  validates_format_of       :father_email,:mother_email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i 
end
