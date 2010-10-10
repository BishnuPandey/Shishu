class UserMailer < ActionMailer::Base
def registration_information(login,email,password,code)
 recipients email
  from "Shishu Clinic <info@wserve.com>"
  subject "Shishu Clinic Registration Information"
  body :pass =>password , :username => login,:shishu_code=>code
 
end

def forget_password(login,email,password)
  recipients email
  from "Shishu Clinic <info@wserve.com>"
  subject "Shishu Clinic Forget Password Information"
  body :pass =>password , :username => login
end

def newsletter(user, newsletter)
  recipients user.email
  
  from "Shishu Clinic <noreply@wserve.com>"
   headers    "Reply-to" => "noreply@wserve.com" 
  subject newsletter.subject
  body :body => newsletter.body, :user => user,:ecard=>"<img src='http://shishu.afterpinkslip.com/images/ecards/"+newsletter.file_name+"' />"
 
end

def vaccination_information(to,subject,message)
recipients to.email
  from "Shishu Clinic <info@wserve.com>"
  subject subject
  body :body => message
end
  
  
  
  
  
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
  
    #@body[:url]  = "http://YOURSITE/activate/#{user.activation_code}"
    @body[:url]  = "http://#{SITE_URL}/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    #@body[:url]  = "http://YOURSITE/"
    @body[:url]  = "http://#{SITE_URL}/"
  end
  
   def forgot_password(user)
     setup_email(user)
     @subject    += 'You have requested to change your password'
     @body[:url]  = "http://localhost:3000/reset_password/#{user.password_reset_code}"
   end
  
   def reset_password(user)
     setup_email(user)
     @subject    += 'Your password has been reset.'
   end
  
  
  
  
  
  protected
    def setup_email(user)
      @recipients  = "#{user.login}"
      @from        = "Shishu Well Baby Clinic <info@wserve.com>"
      @subject     = "Shishu Well Baby Clinic"
      @sent_on     = Time.now
      @body[:user] = user
    end
end
