class AddDescriptionToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :description, :string
  end
end
