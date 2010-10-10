class AddBillNumber < ActiveRecord::Migration
  def self.up
  add_column :billing_entries,:receipt_number,:string       
  end

  def self.down
  remove_column :billing_entries,:receipt_number
  end
end
