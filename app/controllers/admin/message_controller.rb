class  Admin::MessageController < ApplicationController
include AuthenticatedadminSystem
include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
before_filter :protect_admin
  def index
    @title="Shishu : The Well Baby Clinic :Admin : Messages From Parents"
   @messages=Message.find(:all,:order=>'created_at DESC')
  end

  def delete
   @message=Message.find(params[:id])
   if @message.destroy
      flash[:notice]="Message deleted"
      
   else
     flash[:notice]="Message not deleted"
   end
   redirect_to :action=>'index' and return
  end

  def show
     @title="Shishu : The Well Baby Clinic :Admin : Messages From Parents"
       @message=Message.find(params[:id])
  if request.post?
          
            if  message=params[:body].blank?
              flash[:notice]=" Message field can not blank"
              return
            end
            to=User.find(params[:user_id])
            
            subject=params[:subject]
            message=params[:body]
             UserMailer.deliver_vaccination_information(to,subject,message)
            flash[:notice]="Message has been sent."
             redirect_to :action=>'index' and return
     else
       
     @message.status='1'
     @message.save
     
     
      end
  
  
  

     
     end
     
end
