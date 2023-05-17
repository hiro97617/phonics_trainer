class CreateLevelParts < ActiveRecord::Migration[6.1]
  def change
    create_table :level_parts do |t|
      t.integer :level
      t.integer :part

      t.timestamps
    end
  end
end
