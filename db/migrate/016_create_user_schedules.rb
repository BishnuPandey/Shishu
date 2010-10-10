class CreateUserSchedules < ActiveRecord::Migration
  def self.up
    create_table :user_schedules do |t|
       t.column :user_id, :int
       t.column :vaccination_date, :date
       t.column :comment, :text
       t.timestamps
    end
  end

  def self.down
    drop_table :user_schedules
  end
end
