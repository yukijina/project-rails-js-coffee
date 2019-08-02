class RemoveFairtradeFromBeans < ActiveRecord::Migration[5.0]
  def change
    remove_column :beans, :fairtrade, :boolean
  end
end
