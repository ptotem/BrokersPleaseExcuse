class CreateShowings < ActiveRecord::Migration
  def change
    create_table :showings do |t|
      t.integer :flat_id
      t.integer :task_id
      t.text :comment

      t.timestamps
    end
  end
end
