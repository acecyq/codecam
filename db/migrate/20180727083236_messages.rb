class Messages < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :rooms, :users, column: :user1_id, primary_key: :id
    add_foreign_key :rooms, :users, column: :user2_id, primary_key: :id
  end
end
