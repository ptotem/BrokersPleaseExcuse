class CreateFurnstats < ActiveRecord::Migration
  def change
    create_table :furnstats do |t|
      t.string :name

      t.timestamps
    end
  end
end
