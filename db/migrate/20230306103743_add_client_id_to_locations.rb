# frozen_string_literal: true

class AddClientIdToLocations < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :hotel, foreign_key: true
  end
end
