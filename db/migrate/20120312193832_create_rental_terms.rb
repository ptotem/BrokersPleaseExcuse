class CreateRentalTerms < ActiveRecord::Migration
  def change
    create_table :rental_terms do |t|
      t.integer :flat_id
      t.integer :rent_year
      t.text :comment
      t.boolean :deposit

      t.timestamps
    end
  end
end
