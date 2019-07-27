class CreateFavoriteAndComments < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_and_comments do |t|
      t.boolean :favorite, default: false
      t.string :comments
      t.integer :user_id
      t.integer :bean_id

      t.timestamps
    end
  end
end
