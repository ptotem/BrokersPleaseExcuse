class CreateBuildingRoutes < ActiveRecord::Migration
  def change
    create_table :building_routes do |t|
      t.integer :building_id
      t.text :name

      t.timestamps
    end
  end
end
