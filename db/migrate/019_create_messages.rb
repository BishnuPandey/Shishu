class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
    t.column :subject,:string
    t.column :body,:text
    t.column :user_id,:int
    t.column :status,:string,:default=>'0'
    t.timestamps
    end
      execute "ALTER TABLE messages ADD CONSTRAINT message_fc FOREIGN KEY (user_id) REFERENCES users (id);"
  end

  def self.down
    drop_table :messages
  end
end
