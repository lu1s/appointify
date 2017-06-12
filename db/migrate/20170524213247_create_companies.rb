class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :legal_name
      t.string :website
      t.string :facebook_page
      t.string :twitter_page
      t.string :phone_number
      t.string :phone_number2
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
