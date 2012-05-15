class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :city_id
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
