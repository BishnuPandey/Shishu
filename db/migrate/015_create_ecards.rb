class CreateEcards < ActiveRecord::Migration
  def self.up
    create_table :ecards do |t|
      t.column :subject,:string
      t.column :body, :text
      t.column :file_name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :ecards
  end
end
