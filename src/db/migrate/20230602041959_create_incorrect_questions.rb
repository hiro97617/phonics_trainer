class CreateIncorrectQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :incorrect_questions do |t|
      t.references :multiple_choice_challenger, null: false, foreign_key: true
      t.references :multiple_choice_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
