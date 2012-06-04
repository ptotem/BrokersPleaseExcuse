class AddTaggingAllowedToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :tagging_allowed, :boolean

  end
end
