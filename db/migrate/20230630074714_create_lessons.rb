class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :phoneme, null: false
      t.references :level_part, null: false, foreign_key: true

      t.timestamps
    end
  end
end
