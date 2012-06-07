class CreateBhkConfigs < ActiveRecord::Migration
  def change
    create_table :bhk_configs do |t|
      t.string :name

      t.timestamps
    end
  end
end
