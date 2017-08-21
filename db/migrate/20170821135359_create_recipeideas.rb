class CreateRecipeideas < ActiveRecord::Migration[5.1]
  def change
    create_table :recipeideas do |t|
      t.string :title
      t.string :idea
      t.integer :user_id

      t.timestamps
    end
  end
end
