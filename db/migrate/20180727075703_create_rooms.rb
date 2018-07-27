class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :user1
      t.references :user2

      t.timestamps
    end

    # add_foreign_key :rooms, :users, column: :user1, primary_key: :id
    # add_foreign_key :rooms, :users, column: :user2, primary_key: :id
  end
end
