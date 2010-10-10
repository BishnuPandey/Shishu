class CreateBillingDetails < ActiveRecord::Migration
  def self.up
    create_table :billing_details do |t|
      
      t.column :billing_entry_id, :int
      t.column :stock_id, :int
      t.column :quantity, :int
      t.column :rate, :double
      t.column :total_amount, :double
      t.timestamps
    end
  end

  def self.down
    drop_table :billing_details
  end
end
