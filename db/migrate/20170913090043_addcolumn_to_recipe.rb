class AddcolumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :memo, :string
  end
end
