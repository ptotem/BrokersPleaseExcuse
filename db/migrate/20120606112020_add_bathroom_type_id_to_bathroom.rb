class AddBathroomTypeIdToBathroom < ActiveRecord::Migration
  def change
    add_column :bathrooms, :bathroom_type_id, :integer

  end
end
