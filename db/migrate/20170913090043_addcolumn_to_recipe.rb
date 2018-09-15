class AddcolumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :memo, :string
    add_column :recipes, :date, :date, null: false
    add_column :recipes, :category, :text, null: false, default: 0, limit: 1
  end
end
