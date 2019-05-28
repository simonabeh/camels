class AddCoordinatesToCamels < ActiveRecord::Migration[5.2]
  def change
    add_column :camels, :latitude, :float
    add_column :camels, :longitude, :float
  end
end
