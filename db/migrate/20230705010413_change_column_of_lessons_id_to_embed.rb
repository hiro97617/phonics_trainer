class ChangeColumnOfLessonsIdToEmbed < ActiveRecord::Migration[6.1]
  def change
    drop_table :embeds do |t|
      t.integer :media_type
      t.string :media_url
      t.text :description
      t.references :lessons, null: false, foreign_key: true

      t.timestamps
    end
  end
end
