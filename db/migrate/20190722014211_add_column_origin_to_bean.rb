class AddColumnOriginToBean < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :origin_1, :string
    add_column :beans, :origin_2, :string
    add_column :beans, :origin_3, :string
  end
end
