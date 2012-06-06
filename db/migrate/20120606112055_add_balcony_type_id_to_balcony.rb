class AddBalconyTypeIdToBalcony < ActiveRecord::Migration
  def change
    add_column :balconies, :balcony_type_id, :integer

  end
end
