class Admin::HomeController < ApplicationController
 include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
 def index
 
        @title="Shishu : The Well Baby Clinic :Admin "
 
 
  items_per_page = 20
    sort = case params['sort']
         
           when "fname"  then "fname"
          
           when "code"  then "code"
           when "code_reverse"  then "code DESC"
           when "dob" then "dob"
           when "dob_reverse" then "dob Desc"
           when "regdate" then "created_at"
           when "regdate_reverse" then "created_at Desc"
           when "fname_reverse"  then "fname DESC"
        
          end
    
    conditions = ["code LIKE ?", "%#{params[:shishu_code]}%"] unless params[:shishu_code].nil?
    conditions = ["fname LIKE ?", "%#{params[:shishu_name]}%"] unless params[:shishu_name].nil?
    @total = User.count(:conditions => conditions)
   @items_pages, @items = paginate :users, :order => sort||"code asc", :conditions => conditions, :per_page => items_per_page
#   @items=User.paginate(:all,:conditions => conditions,:order=>"code ASC", :per_page => items_per_page,:page=>1)
    if request.xml_http_request?
      render :partial => "user_list", :layout => false
    end
 
 end
  
  
  def newuser
      @title="Shishu : The Well Baby Clinic :Admin : Shishu Registration "
    if request.post?
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
   
        if params[:user][:birth_country] and !params[:user][:birth_country].blank?
            params[:user][:birth_country]=Country.find(params[:user][:birth_country]).country_name
        end
         if params[:member][:country] and !params[:member][:country].blank?
            params[:member][:country]=Country.find(params[:member][:country]).country_name
        end
        params[:user][:login]="shishu"+params[:user][:code]
        params[:user][:email]="shishu"+params[:user][:code]+"@hotmail.com"
        params[:user][:password]="shishu"+params[:user][:code]
        @user = User.new(params[:user])
        @member=Member.new(params[:member])
        begin
          User.transaction do
            @member.user=@user
            @user.save!
            @member.save!
             redirect_to :action=>'userdetail',:id=>@user.id and return
          end
        rescue ActiveRecord::RecordInvalid => e
            @user.birth_country=Country.find_by_country_name(params[:user][:birth_country]).id
            #@user.birth_state=params[:user][:birth_state] 
            @member.valid? # force checking of errors even if products failed
            @member.country=Country.find_by_country_name(params[:member][:country]).id
            #@member.state=params[:member][:state]
            #render :action => :index
         end
         
     else
     
       @user=User.new
       default_country=Country.find_by_country_name("Nepal").id
       @user.birth_country=default_country
       @member=Member.new
       @member.country=default_country
   end
   
  end
 
  
   def edituser
      @title="Shishu : The Well Baby Clinic :Admin : Update Shishu Details "
    if request.post?
    @user = User.find(params[:id])
    @member=Member.find_by_user_id(params[:id])
      if params[:user][:birth_country] and !params[:user][:birth_country].blank?
          params[:user][:birth_country]=Country.find(params[:user][:birth_country]).country_name
      end
      
      if params[:member][:country] and !params[:member][:country].blank?
          params[:member][:country]=Country.find(params[:member][:country]).country_name
      end
      begin
        User.transaction do
          @user.update_attributes(params[:user])
          @member.update_attributes(params[:member])
          redirect_to :action=>'userdetail',:id=>@user.id and return
        end
        end
     else
    @user = User.find(params[:id])
    @member=Member.find_by_user_id(params[:id])
   @user.birth_country=Country.find_by_country_name(@user.birth_country).id
    @member.country=Country.find_by_country_name(@member.country).id
# params[:member][:country]=Country.find_by_country_name(@member.country).id
  
   end
 
  end
  
  
#  def previous_vaccination
#    @user = User.find(params[:id])
#    @vaccine=Vaccine.find(:all)
#    if request.post?
#        params[:vaccine_id].each do |vac|
#             previous_vaccination=UserVaccine.new
#             previous_vaccination.vaccine_id=vac.to_i
#             previous_vaccination.user_id=params[:user_id].to_i
#             previous_vaccination.comment=params["other_detail_"+vac]
#             previous_vaccination.vaccine_date=(params["vaccine_date_year_"+vac]+"-"+params["vaccine_date_month_"+vac]+"-"+params["vaccine_date_day_"+vac]).to_date
#             previous_vaccination.from_here="N"
#             previous_vaccination.save
#        end
#        redirect_to :action=>'userdetail',:id=>@user.id and return
#     end
#  end
#     User shcedule Memo #
 def  user_schedule_memo
   @user_schedule=UserSchedule.find(params[:id])
   if request.post?
#    @user_schedule=UserSchedule.find(params[:id])
     old=@user_schedule.memo unless @user_schedule.memo.nil?
     if old
      if @user_schedule.update_attributes(:memo=>old+" <hr/> " + Time.now.to_date.to_s+ ":" + params[:memo])
     
      end
      else
     if @user_schedule.update_attributes(:memo=>Time.now.to_date.to_s+ ":" +params[:memo])
     
      end
     
      end
   end
    render :layout =>false
 end
  
  
  def add_vaccine_schedule
  
    if request.post?
    
   schedule_date=params[:schedule_date_year]+"-"+params[:schedule_date_month]+"-"+params[:schedule_date_day]
       @user_schedule=UserSchedule.new
       @user_schedule.user_id=params[:next_visit_user_id].to_i
              @user_schedule.vaccination_date=schedule_date.to_date
                            @user_schedule.comment=params[:next_visit_comment]
       if @user_schedule.save
       redirect_to :action=>"userdetail",:id=>@user_schedule.user_id and return
       else
        flash[:notice]="Comment can not be blank"
        redirect_to :action=>"userdetail",:id=>@user_schedule.user_id and return
       end
    end
  end
def delete_vaccine_record
   @user_vaccine=UserVaccine.find(params[:id])
   if @user_vaccine.destroy
   flash[:notice]="Vaccine record deleted"
   redirect_to :action=>"userdetail",:id=>params[:user_id] and return
  end
  end
  def delete_next_schedule
   @user_schedule=UserSchedule.find(params[:id])
   if @user_schedule.destroy
   flash[:notice]="Schedule deleted"
   redirect_to :action=>"userdetail",:id=>params[:user_id] and return
  end
  end
  
  
  def userdetail
     @title="Shishu : The Well Baby Clinic :Admin : Shishu Detail "
         @user = User.find(params[:id])
       # vac_schedule(@user)
        @vaccines=Vaccine.find(:all)
        @user_vaccine=UserVaccine.find(:all,:conditions=>['user_id=?',@user.id])
        @user_schedule=UserSchedule.find(:all,:conditions=>['user_id=?',@user.id])
#        @user_vaccine_array=@user_vaccine.map{|u| u.vaccine_id}
       @show_edit_link=true
        if request.post?
            @vaccination=UserVaccine.new(params[:vaccination])
            if @vaccination.save
            flash[:notice]="Vaccination detail updated"
             redirect_to :action=>"userdetail",:id=>@user.id and return
              return
            else
            flash[:notice]="Vaccination detail not updated. Please update again "
            return
            end
             
           
        end
  end
  
  
  def userdetail_print
  
     @title="Shishu : The Well Baby Clinic :Admin : Shishu Detail "
        @user = User.find(params[:id])
        @vaccines=Vaccine.find(:all)
        @user_vaccine=UserVaccine.find(:all,:conditions=>['user_id=?',@user.id])
        @user_schedule=UserSchedule.find(:all,:conditions=>['user_id=?',@user.id])
  render :layout=>false
  end
  
 def show_detail
   @title="Shishu : The Well Baby Clinic :Admin : Shishu Detail "
        @user = User.find(params[:id])
        
 render :layout=>false
 end 
     
     def report
          @users=User.find(:all)
          @vaccine=Vaccine.find(:all)
          
          
     end
     
     end