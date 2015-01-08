class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :product_name
      t.string :brand
      t.integer :price
      t.string :found_at
      t.string :description
      t.string :img_url

      t.timestamps
    end
  end
end
