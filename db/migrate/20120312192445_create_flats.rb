class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :building_id
      t.integer :bhk_config_id
      t.integer :direction_id
      t.integer :interiors_quality_id, :default=>2
      t.integer :view_quality_id, :default=>2
      t.string :name
      t.string :flat_key
      t.integer :area
      t.integer :floor

      t.timestamps
    end
  end
end
