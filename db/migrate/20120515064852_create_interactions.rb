class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.text :comment
      t.integer :created_by
      t.integer :interaction_type_id

      t.timestamps
    end
  end
end
