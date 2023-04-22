# frozen_string_literal: true

class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
