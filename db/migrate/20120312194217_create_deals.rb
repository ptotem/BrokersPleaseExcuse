class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :flat_id
      t.date :deal_date
      t.integer :brokerage
      t.integer :rent
      t.integer :deposit
      t.integer :contact_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
