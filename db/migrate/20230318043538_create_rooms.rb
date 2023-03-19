class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :key_room
      t.string :name_room

      t.timestamps
    end
  end
end
