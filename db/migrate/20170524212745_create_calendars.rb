class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.string :name
      t.string :description

      t.references :superuser, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
