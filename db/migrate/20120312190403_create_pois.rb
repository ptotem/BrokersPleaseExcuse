class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.integer :locality_id
      t.integer :poi_type_id
      t.string :name
      t.text :note

      t.timestamps
    end
  end
end
