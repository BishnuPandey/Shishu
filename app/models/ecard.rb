class Ecard < ActiveRecord::Base
  validates_presence_of :subject, :body
  
  def pictureimg
  end
  SLEEP_TIME = 60
  
  
  def self.upload(input_params)  
  
             # uploads the file,creates table entry
     #raise input_params.inspect
    input_file = input_params[:pictureimg].original_filename
   #abc=File.new(input_file)
    file_ext = File.extname(input_file)
 
 
  #  file_size=File.size(input_file)
   # raise file_size
    #
    # check file type
    #
    #raise file_ext.inspect
    valid_file_ext_type_array=['.jpg','.gif','.jpeg','.png']
    if valid_file_ext_type_array.include?(file_ext)
    is_valid_type = true
    end
     
    if is_valid_type 
        begin
          new_ecard = Ecard.create(:subject => input_params[:subject], :body=>input_params[:body],:file_name=>input_params[:file_name]+file_ext)
        rescue Exception => exception
          flash[:notice]="some error occured"
          return false
        end
      sys_file_name = new_ecard.file_name 
        new_ecard.save
        path_to_store = (RAILS_ROOT + "/public/images/ecards/" +  sys_file_name)
        self.copy_photo_file input_params[:pictureimg] , path_to_store
        # dir = "C:\\rubywork\\files"  
#   
# files = Dir.entries(dir)  
#   
# files.each do |f|  
# next if f == "." or f == ".."  
# oldFile = dir + "\\" + f 
# newFile = dir + "\\_" + f  
# File.rename(oldFile, newFile) 
        
        return true
    else
       
      return false
    end
  end
  
  def self.copy_photo_file temp_file , path_to_store
    begin 
      fp = File.open(path_to_store, "wb")
      fp.write(temp_file.read)
      fp.close 
    rescue Exception => exception
      logger.error{"Error: Opening file for Thumbnail....\n" + exception.message }
    end
  end
  
  
  
end
