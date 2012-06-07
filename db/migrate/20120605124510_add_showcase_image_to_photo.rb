class AddShowcaseImageToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :showcase_image, :boolean,:default=>false

  end
end
