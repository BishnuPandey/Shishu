class Admin::VendorController < ApplicationController

include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
 before_filter :protect_admin
  def index
     @title="Shishu : The Well Baby Clinic :Admin : Vendors"
   @vendors=Vendor.find(:all,:order=>'name ASC')
  end

  def new
      @title="Shishu : The Well Baby Clinic :Admin : Vendors"
    if request.post?
    # raise params.inspect
     @vendor=Vendor.new(params[:vendor])
     if @vendor.save
       flash[:notice]="Vendor successfully added"
       redirect_to :action=>'index' and return
     end
    end
    render :partial=>'vendor_form',:layout=>'admin/admins'
    
  end

  

  def edit
      @title="Shishu : The Well Baby Clinic :Admin : Vendors"
     if request.post?
       @vendor=Vendor.find(params[:id])
      if @vendor.update_attributes(params[:vendor])
        flash[:notice]="Vendor successfully updated"
        redirect_to :action=>'index'and return
      else
        render :partial=>'vendor_form',:layout=>'admin/admins' and return
      end
     end
  
     @vendor=Vendor.find(params[:id])
     render :partial=>'vendor_form',:layout=>'admin/admins'
  end
  
  def paymentstatus
      @title="Shishu : The Well Baby Clinic :Admin : Vendors Payment Status"
    if request.post?
    
     begin
        @vendor=Vendor.find(params[:id])
         invalid=params[:paid]=~/(^[0-9]+$)|(^[0-9]+[.]{1}[0-9]+$)/
        if  invalid.nil? or params[:paid].to_f<0 or params[:paid].to_f>@vendor.due_amount
           
          flash[:notice]="You entered wrong amount to update"
        else
        @vendor.paid_amount +=params[:paid].to_f
        @vendor.due_amount -=params[:paid].to_f
        @vendor.save
        end
     rescue 
        redirect_to :action=>'index' and return
       end
    end
    @vendor=Vendor.find(params[:id])
    
   
 end
 
 def supplieddetail
 @vendor=Vendor.find(params[:id])
 @vendor_supplied_detail= StockVendorDetail.find(:all,:conditions=>["vendor_id=?",@vendor.id])
 @vendor_supplied_item=@vendor_supplied_detail.group_by{|vendor|vendor.stock_id }
 @years=Array.new
 @months=Array.new
 @vendor_supplied_detail.each do |v_supply|
  yr=v_supply.created_at.strftime('%Y')
  mnt=v_supply.created_at.strftime('%m')
  unless @years.include?(yr)
    @years<<yr
  end
  unless @months.include?(mnt)
    @months<<mnt
  end
 end
 if request.post?
 search_date="%"+params[:year]+"-"+params[:month]+"%"
    @filter_vendor_supplied_detail= StockVendorDetail.find(:all,:conditions=>["vendor_id=? and created_at like ?",@vendor.id,search_date])
  @filter_vendor_total=0
  @filter_vendor_supplied_detail.map{|vend| @filter_vendor_total +=vend.total}
 end
 end
 
 
 
 
 
 
end
