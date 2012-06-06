class AddParkingTypeIdToParking < ActiveRecord::Migration
  def change
    add_column :parkings, :parking_type_id, :integer

  end
end
