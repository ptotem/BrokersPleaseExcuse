class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.boolean :is_building

      t.timestamps
    end
  end
end
