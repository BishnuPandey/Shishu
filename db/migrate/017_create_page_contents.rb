class CreatePageContents < ActiveRecord::Migration
  def self.up
    create_table :page_contents do |t|
      t.column :page_name, :string
      t.column :page_title,:string
      t.column :page_content,:text
      t.column :status, :enum, :limit=>[:Show,:Hide]
      t.timestamps
    end
  end

  def self.down
    drop_table :page_contents
  end
end
