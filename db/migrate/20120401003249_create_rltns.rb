class CreateRltns < ActiveRecord::Migration
  def change
    create_table :rltns do |t|
      t.string :name

      t.timestamps
    end
  end
end
