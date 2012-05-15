class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :contact_id
      t.integer :other_id
      t.string :relationship

      t.timestamps
    end
  end
end
