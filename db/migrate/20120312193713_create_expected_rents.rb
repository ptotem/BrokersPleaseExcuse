class CreateExpectedRents < ActiveRecord::Migration
  def change
    create_table :expected_rents do |t|
      t.integer :flat_id
      t.integer :rent_year
      t.integer :expected_rent
      t.integer :minimum_value

      t.timestamps
    end
  end
end
