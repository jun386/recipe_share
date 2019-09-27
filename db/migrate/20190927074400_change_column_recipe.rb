class ChangeColumnRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :materials, :text
  end
end
