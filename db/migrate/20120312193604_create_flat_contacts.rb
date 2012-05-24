class CreateFlatContacts < ActiveRecord::Migration
  def change
    create_table :flat_contacts do |t|
      t.integer :flat_id
      t.integer :contact_id
      t.text :name
      t.integer :rent_year_id
      t.integer :contact_type_id

      t.timestamps
    end
  end
end
