class CreateMembers < ActiveRecord::Migration
  def self.up
  # this table is for the patient parent
    create_table :members do |t|
      t.column :user_id,:integer #for associating member with user i.e parent with their child information
      t.column :father_full_name,:string
      t.column :mother_full_name,:string
      t.column :address,:string
      t.column :city,:string
      t.column :state,:string
      t.column :country, :string
      t.column :father_email, :string
      t.column :mother_email, :string
      t.column :father_cell_phone, :string
      t.column :mother_cell_phone, :string
      t.column :home_phone, :string
      t.column :father_office_phone, :string
      t.column :mother_office_phone, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
