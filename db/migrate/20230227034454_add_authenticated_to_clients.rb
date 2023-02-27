class AddAuthenticatedToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :authenticated, :boolean
  end
end
