class RenameImagesColumnToRecipes < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :images, :image
  end
end
