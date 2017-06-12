class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :customer, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
