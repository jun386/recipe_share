class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.string :images
      t.text :method
      t.string :genre
      t.string :tags
      t.timestamps
    end
  end
end
