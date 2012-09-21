class AddAttachmentFloorplanToFlat < ActiveRecord::Migration
  def self.up
    add_column :flats, :floorplan_file_name, :string
    add_column :flats, :floorplan_content_type, :string
    add_column :flats, :floorplan_file_size, :integer
    add_column :flats, :floorplan_updated_at, :datetime
  end

  def self.down
    remove_column :flats, :floorplan_file_name
    remove_column :flats, :floorplan_content_type
    remove_column :flats, :floorplan_file_size
    remove_column :flats, :floorplan_updated_at
  end
end
