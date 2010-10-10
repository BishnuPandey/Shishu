class Admin::PatientBillingController < ApplicationController
 
 include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
  def index
   @stocks=Stock.find(:all,:conditions=>['item_quantity>0'])
    @stocks_item_name=@stocks.map{|stock| stock.item_name} 
    @user=User.find(1)
  end

end
