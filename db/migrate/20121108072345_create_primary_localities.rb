class CreatePrimaryLocalities < ActiveRecord::Migration
  def change
    create_table :primary_localities do |t|
      t.integer :locality_id
      t.integer :building_id

      t.timestamps
    end
  end
end
