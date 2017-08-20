class CreateProgresses < ActiveRecord::Migration[5.1]
  def change
    create_table :progresses do |t|
      t.text :content
      t.integer :order_number
      t.integer :recipe_id

      t.timestamps
    end
  end
end
