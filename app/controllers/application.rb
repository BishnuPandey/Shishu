# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery  :secret => '984afdc9f369633k8d710371b93661dm'
include AuthenticatedadminSystem
def protect
    unless current_admin 
      flash[:notice]="Please Login"
      redirect_to :controller=>'/admin/sessions',:action=>'new'
      return false
    end
  end
 def protect_admin
#raise current_admin.role.inspect 
 if !(current_admin.role=='SUPER'or current_admin.role=='SUPERUSER')
   
   flash[:notice]="not authorised"
   redirect_to :controller=>'/admin/home',:action=>'index'
  end
 end
  
  private
#  def vac_schedule(user)
#  @user=user
#       #for vaccination chart for each user
#       @vac1 = Hash.new {|h,k| h[k] = [] }
#       @vac2 = Hash.new {|h,k| h[k] = [] }
#       @vaccine=Vaccine.find(:all)
#       @previous_vaccination=PreviousVaccination.find(:all,:conditions=>["user_id=?",@user.id]).map{|vac| vac.vaccine_id}
#       @vaccine.each do|v|
#        reqformat=v.vaccination_time_format
#        case reqformat
#          when "Months"
#              @vac1["#{v.id}"]<< @user.dob + v.vaccination_time_to.months
#              @vac2["#{v.id}"]<< @user.dob + v.vaccination_time_from.months
#          when "Days"
#              @vac1["#{v.id}"]<< @user.dob + v.vaccination_time_to.days 
#              @vac2["#{v.id}"]<< @user.dob + v.vaccination_time_from.days
#          when "Years"
#              @vac1["#{v.id}"]<< @user.dob + v.vaccination_time_to.years 
#              @vac2["#{v.id}"]<< @user.dob + v.vaccination_time_from.years
#         end
#         end
#  end
  
end
