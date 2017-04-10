class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.string :type
      t.integer :top_seats
      t.integer :bottom_seats

      t.timestamps
    end
  end
end
