class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :location
      t.string :website
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :phone
      t.string :zip
      t.string :email
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
