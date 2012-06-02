class AddPositionColumnsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos,:xpos,:integer
    add_column :photos,:ypos,:integer
    add_column :photos,:building_id,:integer
  end
end
