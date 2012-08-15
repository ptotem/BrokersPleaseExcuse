class CreateSearchingAreas < ActiveRecord::Migration
  def change
    create_table :searching_areas do |t|
      t.integer :searching_id
      t.integer :area_id

      t.timestamps
    end
  end
end
