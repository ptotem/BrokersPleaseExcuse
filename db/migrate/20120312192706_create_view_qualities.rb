class CreateViewQualities < ActiveRecord::Migration
  def change
    create_table :view_qualities do |t|
      t.integer :flat_id
      t.integer :quality_id
      t.text :name

      t.timestamps
    end
  end
end
