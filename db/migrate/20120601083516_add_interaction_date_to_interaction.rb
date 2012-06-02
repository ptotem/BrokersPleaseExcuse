class AddInteractionDateToInteraction < ActiveRecord::Migration
  def change
    add_column :interactions, :interaction_date, :datetime

  end
end
