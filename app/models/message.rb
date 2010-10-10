class Message < ActiveRecord::Base
 belongs_to :user
 
   HUMANIZED_ATTRIBUTES = {
    :body=>"Message"
    
  }

  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end 
 
 validates_presence_of :body
 
end
