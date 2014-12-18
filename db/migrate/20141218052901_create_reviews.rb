class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.string :message
      t.integer :user_id
      t.integer :product_id
      t.integer :rating

      t.timestamps
    end
  end
end
