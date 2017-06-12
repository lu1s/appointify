class CreateSuperUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :super_users do |t|
      t.string :email
      t.string :password
      t.string :password_recovery
      t.string :auth_token
      t.string :facebook_token
      t.string :twitter
      t.string :google_token
      t.boolean :active
      t.datetime :last_activity

      t.timestamps
    end
    add_index :super_users, :twitter, unique: true
  end
end
