class Admin::ReportController < ApplicationController
  include AuthenticatedadminSystem
  layout "admin/admins"
  before_filter :protect
  before_filter :protect_admin, :only=>["index","filter_report","total_calculation"]
  def index
      @title="Shishu : The Well Baby Clinic :Admin : Billing  Report"
      @date=Time.now.to_date.strftime("%Y-%m-%d")
      @billing=BillingEntry.find(:all,:conditions=>["created_at like ?",@date+"\%"])
      
    @date=Time.now.to_date.strftime("%d %b,%y")
    #@total_sum=BillingDetail.sum(:total_amount)
    ##############################################
    @total_sum=0.0
    @total_discount=0.0
    @billing.each{|billing|
      particular_billing_total=0
      particular_billing_discount=0
      billing.billing_details.map{|p| particular_billing_total +=p.total_amount
      }
      if !billing.discount.blank?
        
        particular_billing_discount=(particular_billing_total*billing.discount )/100
        
      end
      @total_sum +=particular_billing_total
      @total_discount +=particular_billing_discount
    }
    
    #################################################
    bill=Array.new
   bill=@billing.map{|bill| bill.id}
    @billingdetail_by_item=BillingDetail.find(:all,:conditions=>['billing_entry_id IN (?)',bill])
    @billingdetail_item=@billingdetail_by_item.group_by{|t| t.stock_id}
    #raise @billingdetail_item.inspect
    # @billing=BillingEntry.find(:all)
    
    # @details=@billing.billing_details
    # raise @billing.inspect
  end
  
  
def print_report
    @date = params[:id]
    @title="Shishu Well Baby Clinic : Shishu Report #{@date}"
      
      #@tod_date=@date.strftime("%Y-%m-%d")
      @tod_date=@date
      @user_schedules=UserSchedule.find(:all,:conditions=>["vaccination_date like ?","%"+@tod_date.to_s+"%"],:order=>"created_at Desc")
              
       users_array=Array.new
                
                if !(@user_schedules.blank? or @user_schedules.nil?)
                  
                  @user_schedules.map{|us| 
                      unless users_array.include?(us.user_id)
                      users_array<<us.user_id
                      end
                  }
                end
     @users=User.find(users_array)

  render :layout=>false
end
  
  def transaction_detail
     @billing=BillingEntry.find(params[:id])
     @billing_details=@billing.billing_details
     render :layout=>false
  end
  
  
  def filter_report
    
    if request.xhr?
      if !params[:date_for_month].nil?
        #raise params.inspect
        bymonth=params[:date_for_month] 
        @date=bymonth
        @date= (@date+"-1")

        date_array=@date.split("-")
        
        date= Date.new(date_array[0].to_i, date_array[1].to_i,date_array[2].to_i) 
        @date=date.strftime('%Y-%m')
#        raise @date.inspect
        
        @billing=BillingEntry.find(:all,:conditions=>["created_at like ?",@date+"\%"])
        #  @total_sum=BillingDetail.sum(:total_amount,:conditions=>["created_at like ?", @date+"\%"])
          bill=Array.new
          bill=@billing.map{|bill| bill.id}
          @billingdetail_by_item=BillingDetail.find(:all,:conditions=>['billing_entry_id IN (?)',bill])
          @billingdetail_item=@billingdetail_by_item.group_by{|t| t.stock_id}
        ############################
        total_calculation(@billing)
        
        #########################
        
        
        @date=date.strftime("%b,%Y")
        render :layout=>false
      else
        
        date=params[:date].to_date.strftime("%Y-%m-%d")
        @date=date
        
        @billing=BillingEntry.find(:all,:conditions=>["created_at like ?", date+"\%"])
        bill=Array.new
          bill=@billing.map{|bill| bill.id}
          @billingdetail_by_item=BillingDetail.find(:all,:conditions=>['billing_entry_id IN (?)',bill])
          @billingdetail_item=@billingdetail_by_item.group_by{|t| t.stock_id}
        #@total_sum=BillingDetail.sum(:total_amount,:conditions=>["created_at like ?", date+"\%"])
        #############
        total_calculation(@billing)
        ################# 
        render :layout=>false
      end
    end
  end
  
    
    def member_report
      @title="Shishu : The Well Baby Clinic :Admin : Shishu Report"
      @tod_date=Time.now()
      
      today_date=@tod_date.strftime("%m-%d")
      @tod_date=@tod_date.strftime("%Y-%m-%d")
      @birthday_users=User.find(:all,:conditions=>["dob like ?","%"+today_date+"%"]) 
      @user_schedules=UserSchedule.find(:all,:conditions=>["vaccination_date like ?","%"+@tod_date.to_s+"%"],:order=>"created_at Desc")
              
                users_array=Array.new
                
                if !(@user_schedules.blank? or @user_schedules.nil?)
                  
                  @user_schedules.map{|us| unless users_array.include?(us.user_id)
                      users_array<<us.user_id
                                    end
     }
    end
     @users=User.find(users_array)
     

  
    end
    
    def filter_user_report_month
    
      if request.xhr?
        
        #raise params.inspect
        bymonth=params[:date_for_month] 
        @date=bymonth
        @date= (@date+"-1")

        date_array=@date.split("-")
        
        date= Date.new(date_array[0].to_i, date_array[1].to_i,date_array[2].to_i) 
       
        @date_for_birthday=date.strftime('%m%')
        @users=User.find(:all)
        @tod_date=date.to_s.to_date.strftime('%Y-%m')
#     @month_date=""
        @birthday_users=User.find(:all,:conditions=>["dob like ?","%-"+@date_for_birthday+"-%"])  
               
        @user_schedules=UserSchedule.find(:all,:conditions=>["vaccination_date like ?","%"+@tod_date.to_s+"%"],:order=>"created_at Desc")
              
                users_array=Array.new
                
                if !(@user_schedules.blank? or @user_schedules.nil?)
                  
                  @user_schedules.map{|us| unless users_array.include?(us.user_id)
                      users_array<<us.user_id
                                    end
     }
    end
     @users=User.find(users_array)
     
        render :partial=>'user_list_notification',:layout=>false
      end
      
    end
    def filter_user_report
      
      if request.xhr?
        @users=User.find(:all)
        @tod_date=params[:date].to_date
        today_date=params[:date].to_date.strftime("%m-%d")
        @birthday_users=User.find(:all,:conditions=>["dob like ?","%"+today_date+"%"])  
        
        
        @user_schedules=UserSchedule.find(:all,:conditions=>["vaccination_date like ?","%"+@tod_date.to_s+"%"],:order=>"created_at Desc")
              
                users_array=Array.new
                
                if !(@user_schedules.blank? or @user_schedules.nil?)
                  
                  @user_schedules.map{|us| unless users_array.include?(us.user_id)
                      users_array<<us.user_id
                                    end
     }
    end
     @users=User.find(users_array)
        
        
        render :partial=>'user_list_notification',:layout=>false
      end
      
    end
    
    def total_calculation(billing)
      
      @total_sum=0.0
      @total_discount=0.0
      billing.each{|billing|
        particular_billing_total=0
        particular_billing_discount=0
        billing.billing_details.map{|p| particular_billing_total +=p.total_amount
        }
        if !billing.discount.blank?
          
          particular_billing_discount=(particular_billing_total*billing.discount )/100
          
        end
        @total_sum +=particular_billing_total
        @total_discount +=particular_billing_discount
      }
      
    end



    def send_greeting
      if request.post?
        to=User.find(:all,:conditions=>['id IN (?)',params[:id]])
#      raise to.inspect
        ecard = Ecard.find(params[:nid])
        to.each do |user|
          UserMailer.deliver_newsletter(user, ecard)
        end
        flash[:notice]="Greeting has been sent."
        if params[:from_detail]=="details"
        redirect_to :controller=>'admin/home/', :action=>'userdetail',:id=>to[0].id
        else
        redirect_to :controller=>'admin/report/', :action=>'member_report'
        end
     end
    end  
    
        def inform_for_vaccination
          
          @user=User.find(params[:user_id])
          
          @schedule=UserSchedule.find(params[:schedule_id])
          render :layout=>false
          if request.post?
            
            if params[:subject].blank? or  message=params[:message].blank?
              flash[:notice]="Subject or Message field can not blank"
              return
            end
            to=@user
            subject=params[:subject]
            message=params[:message]
             UserMailer.deliver_vaccination_information(to,subject,message)
            flash[:notice]="Message has been sent."
            
          end
        end
    
end
