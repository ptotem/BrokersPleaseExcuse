class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :rltn_id
      t.string :name
      t.string :facebook
      t.string :linkedin

      t.timestamps
    end
  end
end
