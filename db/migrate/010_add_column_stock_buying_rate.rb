class AddColumnStockBuyingRate < ActiveRecord::Migration
  def self.up
   add_column :stocks,:buying_rate,:float       
  end

  def self.down
   remove_column :stocks,:buying_rate
  end
end

