class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
    t.column :country_code, :string
    t.column :country_name, :string
    end
  end

  def self.down
    drop_table :countries
  end
end
