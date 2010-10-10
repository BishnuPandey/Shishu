# This controller handles the login/logout function of the site.  
class Admin::SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedadminSystem
  
layout "admin/admins"
  # render new.rhtml
  def new
    @title="Shishu : The Well Baby Clinic : Admin Login"
     if logged_in?
        redirect_to :controller=>'/admin/home' and return
       end
  end

  def create
    self.current_admin = Admin.authenticate(params[:login], params[:password])
   
    if logged_in?
    
      if params[:remember_me] == "1"
        current_admin.remember_me unless current_admin.remember_token?
        cookies[:auth_token] = { :value => self.current_admin.remember_token , :expires => self.current_admin.remember_token_expires_at }
      end
      redirect_back_or_default('/admin/home')
      flash[:notice] = "Logged in successfully"
    else
     
      render :action => 'new'
    end
  end

  def destroy
    self.current_admin.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/admin/admins')
  end
end
