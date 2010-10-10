# This controller handles the login/logout function of the site.  
class ShishuController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
    @title="Shishu : The Well Baby Clinic : Member Login"
     if logged_in_user?
          redirect_to :controller=>'/shishu'   and return   
       end
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in_user?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default('/shishu/index')
      flash[:notice] = "Logged in successfully"
     
    else
    flash[:notice] = "Wrong Login/password combination"
      redirect_to :action => 'new'
    end
  end

  def destroy
    #self.current_user.forget_me if logged_in_user?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/shishu/new')
  end
  def index
   if !logged_in_user?
    flash[:notice] = "Please login ."
    redirect_to :action=>'new',:controller=>"shishu" and return
  end   
  @title="Shishu : The Well Baby Clinic : Member Area"
    @user = current_user 
#    @vaccines=Vaccine.find(:all)
#     @user_vaccine=UserVaccine.find(:all,:conditions=>['user_id=?',@user.id])
##     @user_vaccine_array=@user_vaccine.map{|u| u.vaccine_id}
     #vac_schedule(@user)
     #
     #
     #
#       @user = User.find(params[:id])
       # vac_schedule(@user)

        @vaccines=Vaccine.find(:all)
        @user_vaccine=UserVaccine.find(:all,:conditions=>['user_id=?',@user.id])
        @user_schedule=UserSchedule.find(:all,:conditions=>['user_id=?',@user.id])
#        @user_vaccine_array=@user_vaccine.map{|u| u.vaccine_id}
      if request.post?

       params[:message][:user_id]=current_user.id
       @message=Message.new(params[:message])
       if @message.save
        flash[:notice]="Message send"
        @message=Message.new
       else
         flash[:notice]="Message not send"
       end
      
      end
      
  end
  
  def contents
 
  
   @page=PageContent.find(params[:id])
     
  @title="Shishu : The Well Baby Clinic : #{@page.page_name}"
   end
 
   def home
     @title="Shishu : The Well Baby Clinic"
   end

 
  
end
