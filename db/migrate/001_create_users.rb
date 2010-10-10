class CreateUsers < ActiveRecord::Migration
  def self.up
    #this is table is for patient
    create_table "users", :force => true do |t|
      t.column :code, :string #patient code
      t.column :fname, :string #patient firstname
      t.column :mname, :string #patient middlename
      t.column :lname, :string #patient lastname
      t.column :dob, :date #patient date of birth
      t.column :tob, :time #patient time of birth
      t.column :sex, :enum, :limit=>[:M,:F] #patient sex
      t.column :height, :string #patient height 
      t.column :weight, :string #patient weight
      t.column :birth_address,:string #patient birth address
      t.column :birth_city,:string #patient birth city
      t.column :birth_state,:string #patient birth state
      t.column :birth_country,:string #patient birth country
      t.column :login,                     :string #login name
      t.column :email,                     :string 
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :comment, :text #patient code
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      #t.column :remember_token,            :string
      #t.column :remember_token_expires_at, :datetime
      
      
    end
  end

  def self.down
    drop_table "users"
  end
end
