class CreateTaskings < ActiveRecord::Migration
  def change
    create_table :taskings do |t|
      t.integer :interaction_id
      t.datetime :due_date
      t.integer :assigned_to
      t.boolean :active

      t.timestamps
    end
  end
end
