class AddCarriagesNumber < ActiveRecord::Migration[5.0]
  def change
    add_column :carriages, :number, :string
  end
end
