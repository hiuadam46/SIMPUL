class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :key_room
      t.integer :key_user
      t.string :message

      t.timestamps
    end
  end
end
