class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table "admins", :force => true do |t|
     t.column :login,                     :string
      t.column :email,                     :string
      t.column :full_name,                 :string
      t.column :address,                   :string
      t.column :city,                      :string
      t.column :country,                   :string
      t.column :role,                      :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      
    end
   Admin.create(:login=>"admin",:email=>"admin@admin.com",:full_name=>"Shishu clinic admin",:address=>"Kathmandu",:city=>"Kathmandu",:country=>"NEPAL",:role=>"SUPERUSER",:password=>"123456",:password_confirmation=>"123456")
    
  end

  def self.down
    drop_table "admins"
  end
end
