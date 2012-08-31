class CreateContactTypesContactsJoinTable < ActiveRecord::Migration
  def change
    create_table :contact_types_contacts, :id => false do |t|
      t.integer :contact_id
      t.integer :contact_type_id, :default=>1
    end
  end
end
