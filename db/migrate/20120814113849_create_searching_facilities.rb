class CreateSearchingFacilities < ActiveRecord::Migration
  def change
    create_table :searching_facilities do |t|
      t.integer :searching_id
      t.integer :facility_id

      t.timestamps
    end
  end
end
