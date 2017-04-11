class RenameCarriagesTypeToKind < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :type, :kind
  end
end
