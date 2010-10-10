class Admin::CmsController < ApplicationController
include AuthenticatedadminSystem
layout "admin/admins"
  before_filter :protect
  before_filter :protect_admin
  def index
     @title="Shishu : The Well Baby Clinic :Admin : Page Management"
  @pages=PageContent.find(:all)
  end

  def add
     @title="Shishu : The Well Baby Clinic :Admin : Page Management"
  
  if request.post?
  
  @page=PageContent.new(params[:page])
    if @page.save
    flash[:notice]="Page successfully created."
    redirect_to :action=>"index"
    end
  end
  @page=PageContent.new
  end

  def edit
     @title="Shishu : The Well Baby Clinic :Admin : Page Management"
 if request.post?
  @page=PageContent.find(params[:id])
    if @page.update_attributes(params[:page])
    flash[:notice]="Page successfully updated."
    redirect_to :action=>"index"
    end
  end
  @page=PageContent.find(params[:id])
  end

  def show
     @title="Shishu : The Well Baby Clinic :Admin : Page Management"
    @page=PageContent.find(params[:id])
  end
  def delete
     @page=PageContent.find(params[:id])
     if @page.destroy
     flash[:notice]="Page deleted"
      
       redirect_to :action=>"index"
     end
  end
end
