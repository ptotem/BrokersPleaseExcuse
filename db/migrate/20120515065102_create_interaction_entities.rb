class CreateInteractionEntities < ActiveRecord::Migration
  def change
    create_table :interaction_entities do |t|
      t.integer :interaction_id
      t.integer :entity_id

      t.timestamps
    end
  end
end
