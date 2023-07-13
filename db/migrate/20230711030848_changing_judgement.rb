class ChangingJudgement < ActiveRecord::Migration[6.1]
  def change
    drop_table :correct_questions do |t|
      t.references :multiple_choice_challenger, null: false, foreign_key: true
      t.references :multiple_choice_question, null: false, foreign_key: true
      t.timestamps
    end

    drop_table :incorrect_questions do |t|
      t.references :multiple_choice_challenger, null: false, foreign_key: true
      t.references :multiple_choice_question, null: false, foreign_key: true
      t.timestamps
    end

    create_table :multiple_choice_judgements do |t|
      t.references :multiple_choice_challenger, null: false, foreign_key: true, index: { name:
      'multiple_choice_challengers_judgement'}
      t.references :multiple_choice_question, null: false, foreign_key: true
      t.integer :judgement, null: false
      t.timestamps
    end
  end
end
