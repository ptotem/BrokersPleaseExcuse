class CreateDealRelations < ActiveRecord::Migration
  def change
    create_table :deal_relations do |t|
      t.string :name

      t.timestamps
    end
  end
end
