class AddImageToMultipleChoices < ActiveRecord::Migration[6.1]
  def change
    add_column :multiple_choices, :image, :string
  end
end
