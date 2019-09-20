class RenamePostIdToRecipeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :post_id, :recipe_id
  end
end
