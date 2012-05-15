class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.integer :building_id
      t.string :name

      t.timestamps
    end
  end
end
