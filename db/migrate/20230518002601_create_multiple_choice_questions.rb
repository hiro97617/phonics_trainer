class CreateMultipleChoiceQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :multiple_choice_questions do |t|
      t.string :body, null: false
      t.references :level_part, null: false, foreign_key: true

      t.timestamps
    end
  end
end
