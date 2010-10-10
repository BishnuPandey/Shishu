class BillController < ApplicationController
  include AuthenticatedSystem
 def index
  if !logged_in_user?
          redirect_to :controller=>'/shishu'   and return   
       end
   @title="Shishu : The Well Baby Clinic :Member Area : Billing Details"
   
   @billings=BillingEntry.find(:all,:conditions=>['user_id=?',current_user.id],:order=>"created_at DESC")
#   @total_sum=0.0
#   @total_discount=0.0
#   @billing.each{|billing|
#    particular_billing_total=0
#    particular_billing_discount=0
#    billing.billing_details.map{|p| particular_billing_total +=p.total_amount
#   }
#    if !billing.discount.blank?
#    
#    particular_billing_discount=(particular_billing_total*billing.discount )/100
#   
#    end
#    @total_sum +=particular_billing_total
#    @total_discount +=particular_billing_discount
#   }
#   
#   @date=Time.now.to_date.strftime("%Y-%m")
   # @billing=BillingEntry.find(:all)
   
   # @details=@billing.billing_details
   # raise @billing.inspect
 end
# def filter_report
#   
#   if request.xhr?
#     if !params[:date_for_month].nil?
#       #raise params.inspect
#       bymonth=params[:date_for_month] 
#       @date=bymonth
#       
#       #    raise date
#       @billing=BillingEntry.find(:all,:conditions=>["created_at like ?", @date+"\%"])
#      # @total_sum=BillingDetail.sum(:total_amount,:conditions=>["created_at like ?", @date+"\%"])
#       @total_sum=0.0
#   @total_discount=0.0
#   @billing.each{|billing|
#    particular_billing_total=0
#    particular_billing_discount=0
#    billing.billing_details.map{|p| particular_billing_total +=p.total_amount
#   }
#    if !billing.discount.blank?
#    
#    particular_billing_discount=(particular_billing_total*billing.discount )/100
#   
#    end
#    @total_sum +=particular_billing_total
#    @total_discount +=particular_billing_discount
#   }
#   
#       @date= (@date+"-1")
#       
#       date_array=@date.split("-")
#       
#       date= Date.new(date_array[0].to_i, date_array[1].to_i,date_array[2].to_i) 
#       
#       @date=date.strftime("%b,%Y")
#       render :layout=>false
#     else
#       
#       date=params[:date].to_date.strftime("%Y-%m-%d")
#       @date=date
#       #    raise date
#       @billing=BillingEntry.find(:all,:conditions=>["created_at like ?", date+"\%"])
#       @total_sum=BillingDetail.sum(:total_amount,:conditions=>["created_at like ?", date+"\%"])
#       render :layout=>false
#     end
#   end
# end
  
end
