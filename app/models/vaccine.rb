class Vaccine < ActiveRecord::Base
 validates_presence_of :vaccine_name,:vaccination_time_format,:vaccination_time_from,:vaccination_time_to,:vaccine_description,:vaccine_type,:vaccine_type,:vaccine_side_effects
 validates_numericality_of :vaccination_time_to,:vaccination_time_from
has_one :stock
has_many :user_vaccines
end
