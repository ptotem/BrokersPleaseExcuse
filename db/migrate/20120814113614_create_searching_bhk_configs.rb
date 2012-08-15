class CreateSearchingBhkConfigs < ActiveRecord::Migration
  def change
    create_table :searching_bhk_configs do |t|
      t.integer :searching_id
      t.integer :bhk_config_id

      t.timestamps
    end
  end
end
