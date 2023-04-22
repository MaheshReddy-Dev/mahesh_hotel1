# frozen_string_literal: true

class CreateRoomsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.string :type
      t.float :price
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
