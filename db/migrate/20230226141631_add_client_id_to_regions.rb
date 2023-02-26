class AddClientIdToRegions < ActiveRecord::Migration[7.0]
  def change
    add_reference :regions, :client, foreign_key: true
  end
end
