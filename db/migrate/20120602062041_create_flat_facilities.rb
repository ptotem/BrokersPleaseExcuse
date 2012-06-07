class CreateFlatFacilities < ActiveRecord::Migration
  def change
    create_table :flat_facilities do |t|
      t.integer :flat_id
      t.integer :facility_id

      t.timestamps
    end
  end
end
