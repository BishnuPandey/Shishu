class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.column :item_name ,:string
      t.column :item_description ,:text
      t.column :item_quantity ,:int
      t.column :item_unit_rate ,:double
      t.column :item_unit_type ,:string
      t.column :min_stock ,:int
      t.column :max_stock ,:int
      t.column :lock_version,:int,:default => 0
      t.column :item_type ,:string
      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
