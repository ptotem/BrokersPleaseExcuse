class CreateFlatContacts < ActiveRecord::Migration
  def change
    create_table :flat_contacts do |t|
      t.integer :flat_id
      t.integer :contact_id
<<<<<<< HEAD
      t.integer :rent_year
      t.string :contact_type
      t.text :name
=======
      t.integer :rent_year_id
      t.integer :contact_type_id
      t.text :comment
>>>>>>> origin/arijit

      t.timestamps
    end
  end
end
