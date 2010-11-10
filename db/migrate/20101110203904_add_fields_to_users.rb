class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :middle_initial, :string
    add_column :users, :last_name, :string
    add_column :users, :position, :string
    add_column :users, :bio, :text
  end

  def self.down
    remove_column :users, :bio
    remove_column :users, :position
    remove_column :users, :last_name
    remove_column :users, :middle_initial
    remove_column :users, :first_name
  end
end
