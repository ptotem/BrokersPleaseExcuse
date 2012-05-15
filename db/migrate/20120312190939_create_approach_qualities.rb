class CreateApproachQualities < ActiveRecord::Migration
  def change
    create_table :approach_qualities do |t|
      t.integer :building_id
      t.integer :quality_id

      t.timestamps
    end
  end
end
