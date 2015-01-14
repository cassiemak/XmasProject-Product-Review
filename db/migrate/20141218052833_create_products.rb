class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      # t.string :name
      t.string :product_name

      t.string :brand

      # t.decimal :price
      t.integer :price # then you cannot have decimals

      # need a better name
      t.string :found_at

      t.text :description
      t.string :img_url

      t.timestamps
    end
  end
end
