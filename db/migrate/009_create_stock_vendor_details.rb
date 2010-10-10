class CreateStockVendorDetails < ActiveRecord::Migration
  def self.up
    create_table :stock_vendor_details do |t|
     t.column :vendor_id,:integer
     t.column :stock_id, :integer
     t.column :rate, :float
     t.column :quantity, :integer
     t.column :total,:double
     t.column :status,:string
      t.timestamps
    end
    execute "ALTER TABLE stock_vendor_details ADD CONSTRAINT vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES vendors (id);"
        execute "ALTER TABLE stock_vendor_details ADD CONSTRAINT stock_id_fkey FOREIGN KEY (stock_id) REFERENCES stocks (id);"
  end

  def self.down
    drop_table :stock_vendor_details
  end
end
