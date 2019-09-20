class ChangeColumnMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :room_id, :integer
    remove_column :messages, :reciever_id, :integer
  end

end
