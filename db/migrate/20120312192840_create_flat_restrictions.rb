class CreateFlatRestrictions < ActiveRecord::Migration
  def change
    create_table :flat_restrictions do |t|
      t.integer :flat_id
      t.integer :restriction_id
      t.text :comment

      t.timestamps
    end
  end
end
