class CreateBuildingsMovingRequirementsJoinTable < ActiveRecord::Migration
  def change
    create_table :buildings_moving_requirements, :id => false do |t|
      t.integer :building_id
      t.integer :moving_requirement_id
    end
  end
end
