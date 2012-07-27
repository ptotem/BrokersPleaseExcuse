class CreateDealStages < ActiveRecord::Migration
  def change
    create_table :deal_stages do |t|
      t.string :name

      t.timestamps
    end
  end
end
