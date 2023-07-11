class CreateMultipleChoiceQuestionTags < ActiveRecord::Migration[6.1]
  def change
    create_table :multiple_choice_question_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :multiple_choice_question, null: false, foreign_key: true, index: {
        name: 'multiple_choice_question_tags_index'}

      t.timestamps
    end
  end
end
