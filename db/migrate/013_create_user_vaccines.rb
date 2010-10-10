class CreateUserVaccines < ActiveRecord::Migration
  def self.up
    create_table :user_vaccines do |t|
      t.column :user_id, :integer
      t.column :vaccine_id, :integer
      t.column :vaccine_date, :date
      t.column :comment,:text
      t.timestamps
    end
  end

  def self.down
    drop_table :user_vaccines
  end
end
