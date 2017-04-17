class AddSortOrderToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :head_order, :boolean, default: true
  end
end
