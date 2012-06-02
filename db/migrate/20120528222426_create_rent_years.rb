class CreateRentYears < ActiveRecord::Migration
  def change
    create_table :rent_years do |t|
      t.string :name

      t.timestamps
    end
  end
end
