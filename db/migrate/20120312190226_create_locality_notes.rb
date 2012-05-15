class CreateLocalityNotes < ActiveRecord::Migration
  def change
    create_table :locality_notes do |t|
      t.integer :locality_id
      t.text :comment

      t.timestamps
    end
  end
end
