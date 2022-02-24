class ChangeLocalisationtoOffers < ActiveRecord::Migration[6.0]
  def change
    rename_column :rents, :localisation, :address
    rename_column :offers, :localisation, :address
  end
end
