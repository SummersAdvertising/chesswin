class AlternateUserLastLoginToTimestamp < ActiveRecord::Migration
  def up
  	remove_column :users, :last_login
  	add_column :users, :last_login, :timestamp
  end

  def down
  	remove_column :users, :last_login
  end
  
end
