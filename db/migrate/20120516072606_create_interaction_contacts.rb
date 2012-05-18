class CreateInteractionContacts < ActiveRecord::Migration
  def change
    create_table :interaction_contacts do |t|
      t.integer :interaction_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
