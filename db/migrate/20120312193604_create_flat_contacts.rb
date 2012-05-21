class CreateFlatContacts < ActiveRecord::Migration
  def change
    create_table :flat_contacts do |t|
      t.integer :flat_id
      t.integer :contact_id
      t.integer :rent_year_id
      t.integer :contact_type_id
      t.text :comment

      t.timestamps
    end
  end
end
