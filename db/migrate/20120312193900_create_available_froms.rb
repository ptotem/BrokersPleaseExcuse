class CreateAvailableFroms < ActiveRecord::Migration
  def change
    create_table :available_froms do |t|
      t.integer :flat_id
      t.integer :rent_year
      t.date :name

      t.timestamps
    end
  end
end
