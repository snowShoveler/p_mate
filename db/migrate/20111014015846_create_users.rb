class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :first_name, :limit=>75
      t.string  :last_name, :limit=>75 
      t.string  :email 
      t.string  :address
      t.string  :city, :limit=>100
      t.string  :state, :limit=>25
      t.string  :zip, :limit=>25
      t.string  :office_phone, :limit=>25
      t.string  :cell_phone, :limit=>25
      t.string  :fax, :limit=>25
      t.integer :user_type
      t.integer :approver_level_id
      t.boolean :employee
      t.integer :supervisor_id
      t.integer :ccb_member
      t.string  :encrypted_password
      t.timestamps    end
  end

  def self.down
    drop_table :users
  end
end
