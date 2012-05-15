class CreateMovingCharges < ActiveRecord::Migration
  def change
    create_table :moving_charges do |t|
      t.integer :building_id
      t.integer :value

      t.timestamps
    end
  end
end
