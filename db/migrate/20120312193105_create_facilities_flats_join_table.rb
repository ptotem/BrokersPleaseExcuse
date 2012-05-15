class CreateFacilitiesFlatsJoinTable < ActiveRecord::Migration
  def change
    create_table :facilities_flats, :id => false do |t|
      t.integer :flat_id
      t.integer :facility_id
    end
  end
end
