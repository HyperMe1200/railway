class AddCarriagesSeats < ActiveRecord::Migration[5.0]
  def change
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :sitting_seats, :integer
  end
end
