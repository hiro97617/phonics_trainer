class AddDefaultToMultipleChoices < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:multiple_choices, :is_answer, false)
  end
end
