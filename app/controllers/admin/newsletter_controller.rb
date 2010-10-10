class Admin::NewsletterController < ApplicationController
  include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
def index
@newsletters=Newsletter.find(:all)
end

def new
@newsletters=Newsletter.new
end


def show
@newsletter = Newsletter.find(params[:id])
end


def create
  @newsletter = Newsletter.new(params[:newsletter])
  if @newsletter.save
    flash[:notice] = 'Newsletter was successfully created.'
    redirect_to :controller=>'admin/newsletter', :action=>'index'
    else
    render :action => "new"
  end
end

def edit
@newsletter = Newsletter.find(params[:id])
end


def update

  @newsletter = Newsletter.find(params[:id])
  if @newsletter.update_attributes(params[:newsletter])
    flash[:notice] = 'Newsletter was successfully updated.'
       redirect_to :controller=>'admin/newsletter', :action=>'index'
    else
    render :action => "edit"
  end


end

def destroy
  @newsletter = Newsletter.find(params[:id])
  @newsletter.destroy
     redirect_to :controller=>'admin/newsletter', :action=>'index'
end


#def sendmails
#  newsletter = Newsletter.find(params[:id])
#  users = User.find(:all)
#  
#  users.each do |user|
#    Notifier.deliver_newsletter(user, newsletter)
#  end
#  
#  newsletter.update_attribute('sent', true)
#   redirect_to :controller=>'admin/newsletters', :action=>'index'
#end

end
