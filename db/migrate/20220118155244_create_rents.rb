class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.string :name
      t.string :descirption
      t.string :offer_category
      t.string :category
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :localisation
      t.timestamps
    end
  end
end
