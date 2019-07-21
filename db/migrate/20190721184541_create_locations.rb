class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :location_1
      t.string :location_2
      t.string :location_3

      t.timestamps
    end
  end
end
