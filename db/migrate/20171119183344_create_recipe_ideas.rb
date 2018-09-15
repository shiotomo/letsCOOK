class CreateRecipeIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ideas do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.text :content
      t.date :date, null: false

      t.timestamps
    end
  end
end
