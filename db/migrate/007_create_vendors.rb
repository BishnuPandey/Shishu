class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.column :name,:string
      t.column :address,:string
      t.column :cell_number,:string
      t.column :office_phone, :string
      t.column :email, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
