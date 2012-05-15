class CreateFacilityFeatures < ActiveRecord::Migration
  def change
    create_table :facility_features do |t|
      t.integer :facility_id
      t.string :name

      t.timestamps
    end
  end
end
