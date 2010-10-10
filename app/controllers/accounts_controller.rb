class AccountsController < ApplicationController


   include AuthenticatedSystem
  before_filter :check_login,:except=>['forget_password']
  
   def edit
    @title="Shishu : The Well Baby Clinic :Member Area :Edit Password"
   end

  def forget_password
    @title="Shishu : The Well Baby Clinic :Member Area :Forget Password"
   if request.post?
   begin
    @user=User.find_by_email(params[:email])
   if @user.create_new_password
     flash[:notice]="Your new password detail is sent to your email address."
     redirect_to :controller=>'Shishu',:action=>'index' and return
   else
     flash[:notice]="Something went wrong. Try again"
     return
   end
   rescue
     flash[:notice]="No user exist of that email address"
     return
   end
   end
  end

 # Change password action  
   def update
     @title="Shishu : The Well Baby Clinic :Member Area : Change Password"
   return unless request.post?
     if User.authenticate(current_user.login, params[:old_password])
       if ((params[:password] == params[:password_confirmation]) && !params[:password_confirmation].blank?)
         current_user.password_confirmation = params[:password_confirmation]
         current_user.password = params[:password]        
     if current_user.save
           flash[:notice] = "Password successfully updated."
           #redirect_to root_path #profile_url(current_user.login)
           redirect_to :controller=>'shishu'
         else
           flash[:error] = "An error occured, your password was not changed."
           render :action => 'edit'
         end
       else
         flash[:error] = "New password does not match the password confirmation."
         @old_password = params[:old_password]
         render :action => 'edit'      
       end
     else
       flash[:error] = "Your old password is incorrect."
       render :action => 'edit'
     end 
   end
   
   private
   def check_login
    unless current_user
      redirect_to :controller=>'shishu'
    end
   end
end
