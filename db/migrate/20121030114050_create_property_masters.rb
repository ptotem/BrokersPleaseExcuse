class CreatePropertyMasters < ActiveRecord::Migration
  def change
    create_table :property_masters do |t|
      t.string :flat_key
      t.string :flat_name
      t.string :building_name
      t.string :locality
      t.string :area
      t.string :bhk_config
      t.string :furn_status
      t.string :rent
      t.string :related_people
      t.string :available_from
      t.string :floor
      t.string :bathroom
      t.string :parking
      t.string :flat_facilities
      t.string :building_facilities
      t.string :restriction
      t.string :flat_quality

      t.timestamps
    end
  end
end
