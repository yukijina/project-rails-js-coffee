class AddForeingKeyToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :bean_id, :integer
  end
end
