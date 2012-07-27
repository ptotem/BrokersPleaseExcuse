class CreateDealContacts < ActiveRecord::Migration
  def change
    create_table :deal_contacts do |t|
      t.integer :deal_id
      t.integer :contact_id
      t.integer :deal_relation_id
      t.timestamps
    end
  end
end
