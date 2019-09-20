class RenameColumnRecipe < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :tags, :tag_list
  end
end
