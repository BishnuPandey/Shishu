class Admin::AdminsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
before_filter :protect_admin, :except=>'index'
  # render new.rhtml
  def new
    
    @title="Shishu : The Well Baby Clinic : Admin : Manage Admin"
  if  (!@current_admin.role=='SUPER'or !@current_admin.role=='SUPERUSER')
 flash[:notice]="not authorised"
   redirect_to :controller=>'admin/admins',:action=>'list'
  end
  end

  def create
#    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @admin = Admin.new(params[:admin])
    @admin.save
    if @admin.errors.empty?
#      self.current_admin = @admin
#      redirect_back_or_default('/admin/sessions/new')
      redirect_to :controller=>'admin/admins',:action=>'list'
       flash[:notice] = "Admin successfully added!"
    else
    
 flash[:notice] = "Admin not created."
  render :action => 'new'
    end
  end
  
  
  
  
#  def newadmin
#    @admin = Admin.new(params[:admin])
#    return unless request.post?
#    if @admin.save
#    #redirect_back_or_default(:controller => 'admin/admin_sessions', :action => 'login')
#    flash[:notice] = "Admin successfully added!"
#     redirect_to :controller=>'admin/admins',:action=>'adminlist'
#    end
#  #rescue ActiveRecord::RecordInvalid
#  #render :action => 'adminlist'
#  end
#  
 
  
  def list
        @title="Shishu : The Well Baby Clinic :Admin : Manage Admin"
  @admin = Admin.find(:all)
  end
  
  def edit
        @title="Shishu : The Well Baby Clinic :Admin : Manage Admin"
   if request.post?
        @admin = Admin.find(params[:id])
        if  @admin.update_attributes(params[:admin])
          flash[:notice]='Admin successsfully updated !'
           redirect_to :controller=>'admin/admins',:action=>'list'
        end
     else
       @admin = Admin.find(params[:id])
    end
  end
  
  def delete
  
        @admin = Admin.find(params[:id])
      if @admin.destroy
        flash[:notice]='Admin successsfully deleted!'
         redirect_to :controller=>'admin/admins',:action=>'list'
      end
  end
  
 def index
       @title="Shishu : The Well Baby Clinic :Admin : Manage Admin"
  if !logged_in?
  flash[:notice]="Please Login"
  redirect_to :controller=>'admin/sessions',:action=>'new'
  end
 end

end
