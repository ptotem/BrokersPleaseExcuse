class CreateInteriorsQualities < ActiveRecord::Migration
  def change
    create_table :interiors_qualities do |t|
      t.integer :flat_id
      t.integer :quality_id, :default=>2
      t.text :comment

      t.timestamps
    end
  end
end
