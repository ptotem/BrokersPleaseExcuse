class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.integer :area_id
      t.string :name
      t.integer :quality_id, :default=>2
      t.text :comment

      t.timestamps
    end
  end
end
