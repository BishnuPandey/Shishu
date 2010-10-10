class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.column :country_id, :integer
      t.column :country_code, :string
      t.column :state_code,:string
      t.column :state_name,:string      
    end
  end

  def self.down
    drop_table :states
  end
end
