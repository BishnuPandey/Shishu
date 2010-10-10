class UserVaccine < ActiveRecord::Base
belongs_to :vaccine
validates_presence_of     :vaccine_id, :user_id,:comment
HUMANIZED_ATTRIBUTES = {
    :vaccine_id=>"Vaccine Name"
   
  }
end
