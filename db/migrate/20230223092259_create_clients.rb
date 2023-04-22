# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :company
      t.string :emaail
      t.string :password_digest
      t.text :address

      t.timestamps
    end
    add_index :clients, :emaail, unique: true
  end
end
