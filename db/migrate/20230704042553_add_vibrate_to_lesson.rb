class AddVibrateToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :vibrate, :integer
    add_column :lessons, :audio, :string
    add_column :lessons, :alphabet_name, :string
  end
end
