class AddColumnVendorAmountDetail < ActiveRecord::Migration
  def self.up
   add_column :vendors,:paid_amount,:decimal,:precision=>10,:scale=>2,:default=>0.00       
    add_column :vendors,:due_amount,:decimal,:precision=>10,:scale=>2,:default=>0.00       
  end

  def self.down
   remove_column :vendors,:paid_amount
   remove_column :vendors,:due_amount
  end
end

