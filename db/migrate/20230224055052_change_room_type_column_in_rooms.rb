# frozen_string_literal: true

class ChangeRoomTypeColumnInRooms < ActiveRecord::Migration[7.0]
  def change
    rename_column :rooms, :type, :room_type
  end
end
