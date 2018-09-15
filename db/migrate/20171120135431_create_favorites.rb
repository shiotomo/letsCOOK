class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.boolean :star, default: false
      t.integer :recipe_id
      t.integer :user_id

      t.timestamps
    end
  end
end
