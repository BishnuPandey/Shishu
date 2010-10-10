class Admin::StockController < ApplicationController
include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
 before_filter :protect_admin
  def index
     @title="Shishu : The Well Baby Clinic :Admin : Stock Management "
  @stocks=Stock.find(:all,:order=>"item_name ASC")
  end

    def add
      @title="Shishu : The Well Baby Clinic :Admin : Stock Management "
      @vaccines=Vaccine.find(:all)
      @allvendors=Vendor.find(:all)
      
      @status_other=true
      @status_vaccine=false
      if request.post?
        if params[:stock][:item_type]=="other"
          params[:stock][:item_name]=params[:item_name_other]
        else
          @status_other=false
          @status_vaccine=true
        end
        
        
        
        Stock.transaction do
          @stock=Stock.new(params[:stock])
          #raise params[:stock].inspect
          #if 
         if @stock.save
          stock_vendor_detail=StockVendorDetail.new
          stock_vendor_detail.stock_id=@stock.id
          stock_vendor_detail.vendor_id=params[:vendor][:name]
          stock_vendor_detail.rate=@stock.item_unit_rate
          stock_vendor_detail.quantity=@stock.item_quantity
          stock_vendor_detail.total=@stock.buying_rate*@stock.item_quantity
          stock_vendor_detail.status="Not Paid"
          StockVendorDetail.transaction do
            if stock_vendor_detail.save
              vendor=Vendor.find(stock_vendor_detail.vendor_id)
              vendor.due_amount +=stock_vendor_detail.total
              vendor.save
            flash[:notice]="Item created successfully."
            redirect_to :action=>'add' and return
             end
             end
            #@stock=Stock.new
         #   redirect_to :action=>'add' and return
          end #end of @stock.save
      
         
         end #transaction do end
         
      end #end of request.post
    end

  def edit
    @title="Shishu : The Well Baby Clinic :Admin : Stock Management "
  if request.post?
     @stock=Stock.find(params[:id])
     if @stock.update_attributes(params[:stock])
        flash[:notice]="Item edited successfully."
        redirect_to :action=>"index",:controller=>"admin/stock"
     end
  else
     @stock=Stock.find(params[:id])
      @allvendors=Vendor.find(:all)
  end
  end
  
  
  def add_stock
    @title="Shishu : The Well Baby Clinic :Admin : Stock Management "
    @stock=Stock.find(params[:id])
      @allvendors=Vendor.find(:all,:order=>"name asc")
   if request.post?
    # raise params.inspect
   
    if params[:quantity]and !params[:quantity].blank?
     if params[:quantity].to_i >=0  
      
      params[:stock][:item_quantity]=@stock.item_quantity + params[:quantity].to_i  
     
     
     Stock.transaction do
         
          #raise params[:stock].inspect
          #if 
         if @stock.update_attributes(params[:stock])
          stock_vendor_detail=StockVendorDetail.new
          stock_vendor_detail.stock_id=@stock.id
          stock_vendor_detail.vendor_id=params[:vendor][:name]
          stock_vendor_detail.rate=@stock.item_unit_rate
          stock_vendor_detail.quantity=params[:quantity].to_i
          stock_vendor_detail.total=@stock.buying_rate*params[:quantity].to_i
          stock_vendor_detail.status="Not Paid" 
          StockVendorDetail.transaction do
            if stock_vendor_detail.save
              vendor=Vendor.find(stock_vendor_detail.vendor_id)
              vendor.due_amount +=stock_vendor_detail.total
              vendor.save
             flash[:notice]="Stock Updated Successfully"
            redirect_to :action=>'index' and return
             end
            end
           
        
            #@stock=Stock.new
         #   redirect_to :action=>'add' and return
          end #end of @stock.save
      
         
         end #transaction do end
      
     
     
     #else
      # flash[:notice]="Quantity cannot be less than 0."
       
      # redirect_to :action=>"add_stock",:controller=>"admin/stock",:id=>@stock.id and return
     end
     end
     flash[:notice]="Quantity cannot be less than 0 or blank."
       
       redirect_to :action=>"add_stock",:controller=>"admin/stock",:id=>@stock.id and return
   end
  

  end
  
  def stockvendors
  @stock_vendor_details=StockVendorDetail.find(:all,:conditions=>["stock_id=?",params[:id]])
 
  end
  
#  def edit
#  if request.post?
#     @stock=Stock.find(params[:id])
#     
#     if params[:quantity]and !params[:quantity].blank?
#     if params[:quantity].to_i >=0
#      params[:stock][:item_quantity]=@stock.item_quantity + params[:quantity].to_i  
#      else
#       flash[:notice]="Quantity cannot be less than 0."
#       redirect_to :action=>"edit",:controller=>"admin/stock",:id=>@stock.id and return
#      end
#     end
#     if @stock.update_attributes(params[:stock])
#        flash[:notice]="Item edited successfully."
#        redirect_to :action=>"index",:controller=>"admin/stock"
#     end
#  else
#     @stock=Stock.find(params[:id])
#      @allvendors=Vendor.find(:all)
#  end
#  end

  def delete
    @stock=Stock.find(params[:id])
    @stock.destroy
     flash[:notice]="Item deleted successfully."
     redirect_to :action=>"index",:controller=>"admin/stock"
  end
end
