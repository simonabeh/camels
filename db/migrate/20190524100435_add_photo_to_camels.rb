class AddPhotoToCamels < ActiveRecord::Migration[5.2]
  def change
    add_column :camels, :photo, :string
  end
end
