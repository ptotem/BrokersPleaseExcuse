class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :sequence_number
      t.string :image_file_name
      t.string :flat_id

      t.timestamps
    end
  end
end
