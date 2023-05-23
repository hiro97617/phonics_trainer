class CreateMultipleChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :multiple_choices do |t|
      t.boolean :is_answer, null: false
      t.string :body, null: false
      t.references :multiple_choice_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
