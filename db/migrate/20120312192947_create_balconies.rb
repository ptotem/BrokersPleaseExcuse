class CreateBalconies < ActiveRecord::Migration
  def change
    create_table :balconies do |t|
      t.integer :flat_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
