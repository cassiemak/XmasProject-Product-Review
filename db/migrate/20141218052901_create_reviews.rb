class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.string :message
      t.integer :user_id
      t.integer :product_id
      t.integer :rating

      # timestamp is the same thing as
      # t.datetime :created_at
      # t.datetime :updated_at
      t.timestamps
    end
  end
end
