class AddDescriptionToRents < ActiveRecord::Migration[6.0]
  def change
    rename_column :rents, :descirption, :description
  end
end
