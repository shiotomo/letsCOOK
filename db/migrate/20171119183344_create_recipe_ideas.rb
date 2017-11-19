class CreateRecipeIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ideas do |t|
      t.string :title
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
