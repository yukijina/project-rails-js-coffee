class CreateRoasters < ActiveRecord::Migration[5.0]
  def change
    create_table :roasters do |t|
      t.string :roaster_name
      t.string :city
      t.string :state
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
