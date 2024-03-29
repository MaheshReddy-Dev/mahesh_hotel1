# frozen_string_literal: true

class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
