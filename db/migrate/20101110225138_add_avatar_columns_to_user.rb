class AddAvatarColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size, :string
    add_column :users, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :users, :avatar_updated_at
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_name
  end
end
