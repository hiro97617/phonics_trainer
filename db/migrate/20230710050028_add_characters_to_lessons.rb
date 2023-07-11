class AddCharactersToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :sample_image, :string
    add_column :lessons, :big_char_point, :text
    add_column :lessons, :small_char_point, :text
  end
end
