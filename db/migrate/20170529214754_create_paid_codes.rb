class CreatePaidCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :paid_codes do |t|
      t.string :code
      t.boolean :used
      t.datetime :usedon
      t.integer :superuser_id

      t.timestamps
    end
  end
end
