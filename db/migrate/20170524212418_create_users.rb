class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_recovery
      t.string :auth_token
      t.string :facebook_token
      t.string :twitter_token
      t.string :google_token
      t.boolean :active
      t.datetime :last_activity
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country

      t.references :superuser, foreign_key: true

      t.timestamps
    end
  end
end
