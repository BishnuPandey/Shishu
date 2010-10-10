class ChangeBillingDetailsDecimal < ActiveRecord::Migration
  def self.up
    change_column :billing_details, :rate, :decimal, :precision => 10, :scale => 2
    change_column :billing_details, :total_amount, :decimal, :precision => 10, :scale => 2
  end

  def self.down
  end
end
