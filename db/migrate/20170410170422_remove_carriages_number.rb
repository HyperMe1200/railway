class RemoveCarriagesNumber < ActiveRecord::Migration[5.0]
  def change
    remove_column :carriages, :number
  end
end
