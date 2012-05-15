class CreateFlatCiphers < ActiveRecord::Migration
  def change
    create_table :flat_ciphers do |t|
      t.integer :flat_id
      t.integer :rent_year
      t.string :name

      t.timestamps
    end
  end
end
