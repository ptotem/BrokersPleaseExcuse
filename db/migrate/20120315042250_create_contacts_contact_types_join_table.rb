class CreateContactsContactTypesJoinTable < ActiveRecord::Migration
  def change
    create_table :contacts_contact_types, :id => false do |t|
      t.integer :contact_id
      t.integer :contact_type_id
    end
  end
end
