ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_content_type = "text/html"
#ActionMailer::Base.smtp_settings = {
  #  :address => "192.168.0.30",
   # :port => 25,
   # :domain => "192.168.0.30"  
    #}
ActionMailer::Base.smtp_settings = {
    :arguments      => '-i -t -f support@shishu.afterpinkslip.com',
    :address => "localhost",
    :port => 25,
    :domain => "www.shishu.afterpinkslip.com",
    :authentication => :login,
    :user_name => "afterpi",
    :password => "changem3"
   }
   
    
