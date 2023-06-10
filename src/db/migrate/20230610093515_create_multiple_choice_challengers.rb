class CreateMultipleChoiceChallengers < ActiveRecord::Migration[6.1]
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
    drop_table :multiple_choice_challengers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :level_part, null: false, foreign_key: true
      t.integer :score
      t.datetime :start_date
      t.datetime :finish_date
      t.timestamps


    end
  end
end
