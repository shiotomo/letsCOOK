class RenameRecipeIdeasToRecipeideas < ActiveRecord::Migration[5.1]
  def change
    rename_table :recipe_ideas, :recipeideas
  end
end
