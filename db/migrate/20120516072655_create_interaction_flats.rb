class CreateInteractionFlats < ActiveRecord::Migration
  def change
    create_table :interaction_flats do |t|
      t.integer :interaction_id
      t.integer :flat_id

      t.timestamps
    end
  end
end
