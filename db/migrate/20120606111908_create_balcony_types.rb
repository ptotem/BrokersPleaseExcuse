class CreateBalconyTypes < ActiveRecord::Migration
  def change
    create_table :balcony_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
