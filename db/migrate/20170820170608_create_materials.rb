class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :amount
      t.integer :ingredients_number
      t.integer :recipe_id

      t.timestamps
    end
  end
end
