class CreateManufacturers < ActiveRecord::Migration[5.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :location
      t.string :country
      t.string :website

      t.timestamps
    end
  end
end
