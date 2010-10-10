class Admin::VaccinesController < ApplicationController
  include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
 
  def index
    @title="Shishu : The Well Baby Clinic : Admin : Vaccines "
    @vaccines = Vaccine.find(:all,:order=>'vaccine_name asc')
  end
  def show
    @title="Shishu : The Well Baby Clinic : Admin : Vaccines "
    @vaccine = Vaccine.find(params[:id])
  end
  def new
    @title="Shishu : The Well Baby Clinic : Admin : Vaccines "
    @vaccine = Vaccine.new
  end
  def edit
    @title="Shishu : The Well Baby Clinic : Admin : Vaccines "
    @vaccine = Vaccine.find(params[:id])
  end
  def create
    @vaccine = Vaccine.new(params[:vaccine])
      if @vaccine.save
        flash[:notice] = 'Vaccine was successfully created.'
        redirect_to(:action=>'index',:controller=>"admin/vaccines")
      else
        render :action=>'new',:controller=>"admin/vaccines"
      end
  end

  def update
    @title="Shishu : The Well Baby Clinic : Admin : Vaccines "
    @vaccine = Vaccine.find(params[:id])
      if @vaccine.update_attributes(params[:vaccine])
        flash[:notice] = 'Vaccine was successfully updated.'
       redirect_to :controller=>'admin/vaccines', :action=>'index'
      else
        render :action => "edit"
        end
  end

  def destroy
    @vaccine = Vaccine.find(params[:id])
    @vaccine.destroy
     flash[:notice] = 'Vaccine was successfully Deleted.'
  redirect_to(:action=>'index',:controller=>"admin/vaccines")
  end
end
