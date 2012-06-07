class CreateBathroomTypes < ActiveRecord::Migration
  def change
    create_table :bathroom_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
