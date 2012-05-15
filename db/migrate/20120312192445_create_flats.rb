class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :building_id
      t.integer :bhk_config_id
      t.integer :direction_id
      t.string :name
      t.integer :area
      t.integer :floor

      t.timestamps
    end
  end
end
