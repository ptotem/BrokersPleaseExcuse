class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :contact_id
      t.string :name

      t.timestamps
    end
  end
end
