class Admin::EcardController < ApplicationController
 include AuthenticatedadminSystem
layout "admin/admins"
before_filter :protect
  def list
     @title="Shishu : The Well Baby Clinic :Admin : Ecard Management"
    @ecards = Ecard.find(:all,:order=>'created_at DESC')
    #@classifieds = Classified.paginate(:page => params[:page], :per_page => 3)
  end #list end
  
  
  def show
      @title="Shishu : The Well Baby Clinic :Admin : Ecard Management"
    @ecard = Ecard.find(params[:id])
#   classified_id=@classified.category_id
#  @category=Category.find(classified_id)
  end # show end
  def new
     @title="Shishu : The Well Baby Clinic :Admin : Ecard Management"
    @ecard = Ecard.new
   
  end #new end
 
  def create
   if request.post?
    if !params[:ecard][:pictureimg].blank?
          params[:ecard][:file_name]=unique_name_for_geeting_card()
          sleep 5
          if new_greeting_card = Ecard.upload(params[:ecard])
              flash[:notice]="Ecard has been created successfully"
              redirect_to :action=>'list' and return
          else
             flash[:notice]="Valid file type are png|gif|jpeg|jpg only"
             render :action=>'new' and return
          end 
    else
      @ecard = Ecard.new()
      @ecard.subject=params[:ecard][:subject]
      @ecard.body=params[:ecard][:body]
      
      if @ecard.save
        redirect_to :action => 'list' and return
      else 
        render :action => 'new' and return
      end # if end
    end 
   else
     render :action => 'new' and return
   end
end #create end


  
  def delete
    ecard=Ecard.find(params[:id])
    if ecard and !ecard.file_name.blank?
      card_name=ecard.file_name
      file_to_delete=RAILS_ROOT+"/public/images/ecards/#{card_name}"
      #raise file_to_delete.inspect
    end
    if ecard.destroy
       if card_name and File.exist?(file_to_delete)
          File.delete(file_to_delete)
          
       end
       flash[:notice]="Successfully deleted"
    else
       flash[:notice]="Sorry! Try Again"
    end
    redirect_to :action=>'list'
  end
  
  
 def unique_name_for_geeting_card
   letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".split("")
       pass="";
       while(pass=='')
          while pass.size<11 
            pass +=letters[rand(letters.size-1)].to_s
          end
        allcardname=Ecard.find(:all).map{|ecard| ecard.file_name}    
        if allcardname.include?(pass)
          pass=''
        end
      end
   return pass
 end


end
