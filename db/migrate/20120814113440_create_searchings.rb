class CreateSearchings < ActiveRecord::Migration
  def change
    create_table :searchings do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :budget
      t.date :shifting
      t.integer :restriction_id

      t.timestamps
    end
  end
end
