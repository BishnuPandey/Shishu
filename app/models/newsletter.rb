class Newsletter < ActiveRecord::Base
 validates_length_of       :subject,    :within => 3..40
  validates_length_of       :subject,    :within => 3..100
end
