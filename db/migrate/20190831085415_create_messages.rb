class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message
      t.string :image
      t.integer :sender_id
      t.integer :reciever_id
      t.timestamps
    end
  end
end
