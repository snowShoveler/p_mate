class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    #add index in db to enforce uniqueness on email addresses
    add_index :users, :email, :unique => true

  end

  def self.down
    remove_index :users, :email
  end
end
