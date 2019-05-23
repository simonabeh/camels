class CreateCamels < ActiveRecord::Migration[5.2]
  def change
    create_table :camels do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
