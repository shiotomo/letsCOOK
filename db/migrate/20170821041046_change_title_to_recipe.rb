class ChangeTitleToRecipe < ActiveRecord::Migration[5.1]
  def change
    def up
      t.string :title, null => false
    end

    def down
      t.string :title
    end
  end
end
