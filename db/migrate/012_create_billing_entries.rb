class CreateBillingEntries < ActiveRecord::Migration
  def self.up
    create_table :billing_entries do |t|
     t.column :admin_id, :int
      t.column :user_id, :int
      t.column :comment, :text
      t.column :discount, :int
      t.timestamps
    end
  end

  def self.down
    drop_table :billing_entries
  end
end
