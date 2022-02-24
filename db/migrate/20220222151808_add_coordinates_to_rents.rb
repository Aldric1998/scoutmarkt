class AddCoordinatesToRents < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :latitude, :float
    add_column :rents, :longitude, :float
    add_column :offers, :latitude, :float
    add_column :offers, :longitude, :float
  end
end
