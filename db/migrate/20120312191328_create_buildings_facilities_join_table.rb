class CreateBuildingsFacilitiesJoinTable < ActiveRecord::Migration
  def change
    create_table :buildings_facilities, :id => false do |t|
      t.integer :building_id
      t.integer :facility_id
    end
  end
end
