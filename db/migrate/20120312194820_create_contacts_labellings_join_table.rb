class CreateContactsLabellingsJoinTable < ActiveRecord::Migration
  def change
    create_table :contacts_labellings, :id => false do |t|
      t.integer :contact_id
      t.integer :labelling_id
    end
  end
end
