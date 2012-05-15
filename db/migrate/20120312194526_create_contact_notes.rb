class CreateContactNotes < ActiveRecord::Migration
  def change
    create_table :contact_notes do |t|
      t.integer :contact_id
      t.text :comment

      t.timestamps
    end
  end
end
