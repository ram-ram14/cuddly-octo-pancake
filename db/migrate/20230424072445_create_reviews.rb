class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :title
      t.text :content
      t.integer :rating
      t.datetime :created_at

      t.timestamps
    end
  end
end
