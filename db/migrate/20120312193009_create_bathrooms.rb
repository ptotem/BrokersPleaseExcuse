class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.integer :flat_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
