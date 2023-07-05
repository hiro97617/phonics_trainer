class ChangeColumnOfKeyWord < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :key_words, :string
    add_column :lessons, :points, :string, array: true, default: []
  end
end
