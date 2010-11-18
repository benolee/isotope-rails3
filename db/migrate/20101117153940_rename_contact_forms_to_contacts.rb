class RenameContactFormsToContacts < ActiveRecord::Migration
  def self.up
    rename_table :contact_forms, :contacts
  end

  def self.down
    rename_table :contacts, :contact_forms
  end
end
