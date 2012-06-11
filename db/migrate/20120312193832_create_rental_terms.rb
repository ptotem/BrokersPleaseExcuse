class CreateRentalTerms < ActiveRecord::Migration
  def change
    create_table :rental_terms do |t|
      t.integer :flat_id
      t.integer :rent_year
      t.integer :estimated_brokerage
      t.text :package_details
      t.text :landlord_conditions
      t.text :brokerage_details
      t.text :showing_details

      t.timestamps
    end
  end
end
