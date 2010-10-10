class AddMemoUserSchedule < ActiveRecord::Migration
  def self.up
  add_column :user_schedules,:memo,:text      
  end

  def self.down
  remove_column :memo
  end
end


