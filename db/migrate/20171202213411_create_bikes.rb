class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.integer :shop_id
      t.integer :manufacturer_id
      t.string :type

      t.timestamps
    end
  end
end
