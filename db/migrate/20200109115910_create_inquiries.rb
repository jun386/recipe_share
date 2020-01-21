class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|

      t.string :name
      t.string :email
      t.string :phone
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
