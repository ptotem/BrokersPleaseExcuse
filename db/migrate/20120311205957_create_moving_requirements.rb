class CreateMovingRequirements < ActiveRecord::Migration
  def change
    create_table :moving_requirements do |t|
      t.string :name

      t.timestamps
    end
  end
end
