# frozen_string_literal: true

class Addregionidtohotels < ActiveRecord::Migration[7.0]
  def change
    add_reference :hotels, :region, foreign_key: true
  end
end
