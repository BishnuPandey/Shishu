class CreateVaccines < ActiveRecord::Migration
  def self.up
    create_table :vaccines do |t|
         t.column :vaccine_name, :string
         t.column :vaccine_description, :text
         t.column :vaccination_time_from, :int
         t.column :vaccination_time_to,  :int
         t.column :vaccination_time_format,  :string
         t.column :vaccine_type,  :string
         t.column :vaccine_side_effects,  :string
         t.timestamps
    end
  end

  def self.down
    drop_table :vaccines
  end
end
