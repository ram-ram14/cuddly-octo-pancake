# Generated a User Model through the terminal and created a table called 'users' with several columns.
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # Adding a username column with a text data type
      t.text :username
       # Adding an email column with a text data type
      t.text :email
       # Adding a password_digest column with a string data type
      t.string :password_digest
       # Adding a favorite genres column with a text data type
      t.text :favorite_genres
       # Adding a data joined column with a datetime data type
      t.datetime :date_joined

      t.timestamps
    end
  end
end
