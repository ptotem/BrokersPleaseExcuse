class CreateBuildingsRestrictionsJoinTable < ActiveRecord::Migration
  def change
        create_table :buildings_restrictions, :id => false do |t|
          t.integer :building_id
          t.integer :restriction_id
        end
      end
end
