class AddIconToLevelParts < ActiveRecord::Migration[6.1]
  def change
    add_column :level_parts, :icon, :string
  end
end
