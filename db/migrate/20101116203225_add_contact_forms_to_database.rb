class AddContactFormsToDatabase < ActiveRecord::Migration
  def self.up
    create_table :contact_forms do |t|
      t.string :email
      t.text :text
      t.string :nickname
      t.string :company

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_forms
  end
end
