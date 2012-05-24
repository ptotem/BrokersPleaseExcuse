class CreateFlatNotes < ActiveRecord::Migration
  def change
    create_table :flat_notes do |t|
      t.integer :flat_id
      t.text :name

      t.timestamps
    end
  end
end
