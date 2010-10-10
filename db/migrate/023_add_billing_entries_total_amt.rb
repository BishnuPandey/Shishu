class AddBillingEntriesTotalAmt < ActiveRecord::Migration
  def self.up
     add_column :billing_entries,:total_sum,:decimal,:precision=>10,:scale=>2,:default=>0.00       
  end

  def self.down
    remove_column :billing_entries,:total_sum
  end
end
