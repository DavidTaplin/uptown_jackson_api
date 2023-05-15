class AddUserToBuildings < ActiveRecord::Migration[7.0]
  def change
    add_reference :buildings, :user, null: false, foreign_key: true
  end
end
