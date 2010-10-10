class AvatarController < ApplicationController
 
  include AuthenticatedSystem
 
  #before_filter :protect,:except => [:uploadlogo,:deletelogo]

  def index
    #redirect_to hub_ur
    redirect_to :controller=>'shishu',:action=>'index'
  end

  def upload
    @title="Shishu : The Well Baby Clinic :Member Area :Upload Photo"
  
    #@user = User.find(session[:user_id])
    @user=User.find(current_user.id)
    #if param_posted?(:avatar)
    if request.post?
      image = params[:avatar][:image]
      @avatar = Avatar.new(@user, image)
      if @avatar.save
        flash[:notice] = "Your Photo has been uploaded."
        #redirect_to hub_url
        redirect_to :controller=>'shishu',:action=>'index'
      end
    end
  end
  
  # Delete the avatar.
  def delete
    user = User.find(session[:user_id])
    user.avatar.delete
    flash[:notice] = "Your photo has been deleted."
    #redirect_to hub_url
    redirect_to :controller=>'shishu',:action=>'index'
  end
  
 
  

end