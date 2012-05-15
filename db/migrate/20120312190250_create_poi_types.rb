class CreatePoiTypes < ActiveRecord::Migration
  def change
    create_table :poi_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
