class AddColumnToRecipeidea < ActiveRecord::Migration[5.1]
  def change
    add_column :recipeideas, :content, :text
  end
end
