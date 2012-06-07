class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.integer :flat_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
