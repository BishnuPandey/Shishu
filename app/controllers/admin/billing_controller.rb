class Admin::BillingController < ApplicationController
include AuthenticatedadminSystem
layout "admin/admins"
 before_filter :protect
 protect_from_forgery :except => [:additem, :quantity_check, :removeitem,:total_dis,:confirmation] 
  def additem
        @title="Shishu : The Well Baby Clinic :Admin : Billing"
   
   @count=params[:items].size+1
   @stocks=Stock.find(:all,:conditions=>['item_quantity>0 and id NOT IN(?)',params[:items]])

   render :layout=>false
  end
 

 def quantity_check
   
  items_array=Hash.new
  @output=''
  
  i=0
  params[:items].each do |item|
  j=i+1 
   if(params["quantity_#{j}"].to_i>0)
    if items_array.keys.include?(item)
      items_array[item]+=params["quantity_#{j}"].to_i 
    else
      items_array[item]=params["quantity_#{j}"].to_i 
    end
     
   end
   i+=1
   
  end
 unless items_array.empty? 
   items_array.each do |key,val|
     stock=Stock.find(key)
     if(val>stock.item_quantity)
     
      @output +="Only #{stock.item_quantity} #{stock.item_name} is in stock you selected #{val}.<br />"
     end
 
   
   end
 
 end

  
  render :layout=>false
 end
 
  def removeitem
   render :layout=>false
  end
def index
  @title="Shishu : The Well Baby Clinic :Admin : Billing"
if request.post?
  begin
    user=User.find(:first,:conditions=>['code=?',params[:shishu_code]])
    redirect_to :action=>"bill",:id=>user.id and return
  rescue 
    flash[:notice]="No shisu found with this code"
    return
  end
   
end
end

def total_dis
  @subtotal=0.0
  
  for i in 0..params[:items].size-1
   j=i+1
  
   @subtotal=@subtotal+(params["rate_#{j}"].to_f*params["quantity_#{j}"].to_f)
  end
   @discount=params[:discount].to_f
   @grandtotal=@subtotal*(1-@discount/100)

#@subtotal=123
#raise params["rate_"+1]
#@subtotal=@subtotal+(params["rate_"+1]*params["quantity_"+1])
#@discount=params[:discount].to_f
#@grandtotal=@subtotal+@discount
 render :layout=>false
end

def bill
  @title="Shishu : The Well Baby Clinic :Admin : Billing"
  @stocks=Stock.find(:all,:conditions=>['item_quantity>0'])
  @stocks_item_name=@stocks.map{|stock| stock.item_name} 
 @allitems=Stock.find(:all)
  @user=User.find(params[:id])
 if @stocks[0].nil?
 
 flash[:notice]="Stock is empty"
 redirect_to :controller=>"stock" and return
 end
end






def confirmation
  
  
  if request.post?
 BillingEntry.transaction do
 
  i=0
  
  @billing_entry=BillingEntry.new
  @billing_entry.comment=params[:comment]||''
  @billing_entry.discount=params[:discount]
  @billing_entry.user_id=params[:user_id]
  @billing_entry.admin_id=current_admin.id
  @billing_entry.total_sum = params[:subTotal]
 
  @billing_entry.save
  params[:items].each do |item|
  j=i+1 
  if(params["quantity_#{j}"].to_i>0)
       bill_detail=BillingDetail.find(:first,:conditions=>['billing_entry_id=? and stock_id=?',@billing_entry.id,item])
       stock=Stock.find(:first,:conditions=>['id=? and item_quantity>0',item])
       if !stock.blank?
       if !bill_detail.blank?
         
           if !(params["quantity_#{j}"].to_i>stock.item_quantity)
               stock.item_quantity=stock.item_quantity-params["quantity_#{j}"].to_i
               stock.save
               bill_detail.quantity +=params["quantity_#{j}"].to_i
               bill_detail.total_amount +=params["quantity_#{j}"].to_i * bill_detail.rate
               bill_detail.save
            else
               item_quantity_to_add=stock.item_quantity
               stock.item_quantity=stock.item_quantity-item_quantity_to_add
               stock.save
               bill_detail.quantity +=item_quantity_to_add
               bill_detail.total_amount +=item_quantity_to_add * bill_detail.rate
               bill_detail.save
           end #end of   if !(params["quantity_#{j}"].to_i>stock.item_quantity)
       else
          bill_detail=BillingDetail.new
          bill_detail.billing_entry_id=@billing_entry.id
          bill_detail.stock_id=item
          
           if !(params["quantity_#{j}"].to_i>stock.item_quantity)
               stock.item_quantity=stock.item_quantity-params["quantity_#{j}"].to_i
               stock.save
               bill_detail.quantity =params["quantity_#{j}"].to_i
             
               bill_detail.rate =params["rate_#{j}"].to_i
             
               bill_detail.total_amount =bill_detail.quantity* bill_detail.rate
                 
               bill_detail.save
               
            else
               item_quantity_to_add=stock.item_quantity
               stock.item_quantity=stock.item_quantity-item_quantity_to_add
               stock.save
               bill_detail.quantity =item_quantity_to_add
                bill_detail.rate =params["rate_#{j}"].to_i
               bill_detail.total_amount =bill_detail.quantity* bill_detail.rate
               bill_detail.save
           end #end of   if !(params["quantity_#{j}"].to_i>stock.item_quantity)
          
       end #end of if !bill_detail.blank?
     end #end of if(params["quantity_#{j}"].to_i>0) 
     end #end of if !stock.blank?
   i+=1
   
  end #end of do |item|
 
 
 if(BillingDetail.find(:all,:conditions=>['billing_entry_id=?', @billing_entry.id]).blank?)
      @billing_entry.destroy
      redirect_to :controller=>'/admin/billing' and return
  end
  redirect_to :action=>'print_bill',:bill_entry_id=>@billing_entry.id and return

 end #end of transaction
end #end of request.post?

 
  redirect_to :controller=>'/admin/billing' and return

end
def print_bill
 @billentry=BillingEntry.find(params[:bill_entry_id])
 @bill_details=@billentry.billing_details
 
 @user=@billentry.user
 
 @subtotal=0

 @bill_details.map{|bd| @subtotal+=bd.total_amount}
 #@discount=(@billentry.discount*@subtotal)/100
 @discount=@billentry.discount
 @grandtotal=@subtotal-@discount
 render :layout=>false
 
    
end

 



end
