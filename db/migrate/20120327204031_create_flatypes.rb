class CreateFlatypes < ActiveRecord::Migration
  def change
    create_table :flatypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
