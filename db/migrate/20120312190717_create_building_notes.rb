class CreateBuildingNotes < ActiveRecord::Migration
  def change
    create_table :building_notes do |t|
      t.integer :building_id
      t.text :name

      t.timestamps
    end
  end
end
