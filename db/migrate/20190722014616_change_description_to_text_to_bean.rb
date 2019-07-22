class ChangeDescriptionToTextToBean < ActiveRecord::Migration[5.0]
  def change
    change_column :beans, :description, :text
  end
end
