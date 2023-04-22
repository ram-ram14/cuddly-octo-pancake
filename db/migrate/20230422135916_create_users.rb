class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.string :password_digest
      t.text :favorite_genres
      t.datetime :date_joined

      t.timestamps
    end
  end
end
