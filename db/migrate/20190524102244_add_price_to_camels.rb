class AddPriceToCamels < ActiveRecord::Migration[5.2]
  def change
    add_column :camels, :price, :integer
  end
end
