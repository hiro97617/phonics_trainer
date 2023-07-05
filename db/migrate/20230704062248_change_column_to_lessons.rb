class ChangeColumnToLessons < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :phoneme, :string, null: false
    add_column :lessons, :title, :string, null: false
    add_column :lessons, :description, :text
    add_column :lessons, :key_words, :string
  end
end
