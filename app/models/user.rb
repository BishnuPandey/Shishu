require 'digest/sha1'
class User < ActiveRecord::Base
  # Virtual attribute for the unencrypted password
  has_one :member
  has_many :billing_entries
  has_many :messages
   has_many :user_schedules
  attr_accessor :password
  
   HUMANIZED_ATTRIBUTES = {
    :fname=>"Shishu name",
    :lname=>"Last name",
    :dob=>"Date of birth",
    :tob=>"Time of birth",
    :code=>"Shishu Code"
  }

  def self.human_attribute_name(attr)
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end 
    
  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
 # validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 6..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 6..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email,:code, :case_sensitive => false
 
  validates_presence_of :fname,:dob,:tob#,:height,:weight
  validates_format_of       :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i 
  validates_presence_of :sex,:code
 
  #validates_inclusion_of :sex, :in =>['M','F']
  before_save :encrypt_password
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation,:fname,:mname,:lname,:dob,
                  :tob,:height,:weight,:birth_country,:birth_state,:birth_city,:birth_address,:sex,
                  :code,:comment
 # after_create :generate_shishu_code
                   
  def create_new_password
  
  letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".split("")
       pass="";
       while(pass=='')
          while pass.size<7 
            pass +=letters[rand(letters.size-1)].to_s
          end
      end
      self.password=pass
      self.password_confirmation=pass
      if self.save
#      local it doesnt, work so commented for online remove comment
#         UserMailer.deliver_forget_password(self.login,self.email,self.password)
       return true
      else
        return false
      end
  
  end
 #for avatar
  def avatar
    Avatar.new(self)
  end
#  def time_schedule_for_user(vaccine_id)
#    vaccine=Vaccine.find(vaccine_id)
#    vaccine_from=''
#    vaccine_to=''
#    reqformat=vaccine.vaccination_time_format
#        case reqformat
#          when "Months"
#              vaccine_to +=(self.dob + vaccine.vaccination_time_to.months).to_s
#              vaccine_from +=(self.dob + vaccine.vaccination_time_from.months).to_s
#          when "Days"
#              vaccine_to += (self.dob + vaccine.vaccination_time_to.days).to_s 
#              vaccine_from += (self.dob + vaccine.vaccination_time_from.days).to_s
#          when "Years"
#              vaccine_to += (self.dob + vaccine.vaccination_time_to.years).to_s 
#              vaccine_from += (self.dob + vaccine.vaccination_time_from.years).to_s
#         end
#         return vaccine_from +" to "+ vaccine_to
#
#  end 

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated_user?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated_user?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end
  def forgot_password
     @forgotten_password = true
     self.make_password_reset_code
   end
  
   def reset_password
     # First update the password_reset_code before setting the
     # reset_password flag to avoid duplicate email notifications.
     update_attribute(:password_reset_code, nil)
     @reset_password = true
   end  
  
   #used in user_observer
   def recently_forgot_password?
     @forgotten_password
   end
  
   def recently_reset_password?
     @reset_password
   end
   
   def self.find_for_forget(login)
     find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login]
   end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end
  
def change_password(oldpassword,newpassword)
     if self.crypted_password==Digest::SHA1.hexdigest("--#{salt}--#{oldpassword}--")
        self.password=newpassword
        self.password_confirmation=newpassword
       self.save
    else
       return false
    end
  end

  protected
  def generate_shishu_code
  string_for_code=self.id.to_s
  if string_for_code.length<3
    if string_for_code.length==2
      string_for_code="0"+string_for_code
    else
    string_for_code="00"+string_for_code
    end
  end
  self.code="MM" + string_for_code
  self.save
   UserMailer.deliver_registration_information(self.login,self.email,self.password_confirmation,self.code)
  end
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    def make_activation_code

      self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
    
    def make_password_reset_code
     self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
    
end
