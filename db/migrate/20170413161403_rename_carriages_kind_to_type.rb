class RenameCarriagesKindToType < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :kind, :type
  end
end
