class AddIsFloorPlanTpPhoto < ActiveRecord::Migration
  def up
    add_column :photos,:is_floor_plan,:boolean,:default=>false
  end

  def down
  end
end
