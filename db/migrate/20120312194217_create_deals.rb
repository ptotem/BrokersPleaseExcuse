class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :flat_id
      t.integer :deal_stage_id
      t.boolean :own_deal
      t.integer :primary_rm
      t.date :deal_date
      t.integer :package
      t.date :from_date
      t.date :to_date
      t.date :lockin_date
      t.float :landlord_commission
      t.float :tenant_commission

      t.float :expenses
      t.float :net_commission
      t.text :package_details
      t.text :comments
      t.integer :primary_rm_id


      t.timestamps
    end
  end
end
