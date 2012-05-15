class CreateFlatContacts < ActiveRecord::Migration
  def change
    create_table :flat_contacts do |t|
      t.integer :flat_id
      t.integer :contact_id
      t.integer :rent_year
      t.string :contact_type
      t.text :comment

      t.timestamps
    end
  end
end
