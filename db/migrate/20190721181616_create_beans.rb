class CreateBeans < ActiveRecord::Migration[5.0]
  def change
    create_table :beans do |t|
      t.string :brand
      t.string :variety
      t.string :taste_note
      t.string :description
      t.boolean :organic
      t.boolean :fairtrade
      t.integer :roaster_id

      t.timestamps
    end
  end
end
