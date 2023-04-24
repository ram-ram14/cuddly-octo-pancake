class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :plot
      t.text :director
      t.datetime :release_date
      t.text :runtime
      t.text :poster_image
      t.text :cast
      t.text :genre

      t.timestamps
    end
  end
end
