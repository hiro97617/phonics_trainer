class CreateMultipleChoiceChallengers < ActiveRecord::Migration[6.1]
  def change
    create_table :multiple_choice_challengers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :level_part, null: false, foreign_key: true
      t.integer :score
      t.datetime :start_date
      t.datetime :finish_date
    end
  end
end
