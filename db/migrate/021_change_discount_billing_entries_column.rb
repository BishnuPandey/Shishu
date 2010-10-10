class ChangeDiscountBillingEntriesColumn < ActiveRecord::Migration
  def self.up
  change_column :billing_entries, :discount, :decimal, :precision => 10, :scale => 2
  end

  def self.down
  end
end
