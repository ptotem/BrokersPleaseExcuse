class CreateBrokerages < ActiveRecord::Migration
  def change
    create_table :brokerages do |t|
      t.integer :flat_id
      t.integer :rent_year
      t.integer :value

      t.timestamps
    end
  end
end
