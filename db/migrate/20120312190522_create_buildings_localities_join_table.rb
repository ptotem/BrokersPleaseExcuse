class CreateBuildingsLocalitiesJoinTable < ActiveRecord::Migration
  def change
    create_table :buildings_localities, :id => false do |t|
      t.integer :building_id
      t.integer :locality_id
    end
  end
end
