class CreateWeekDays < ActiveRecord::Migration[5.1]
  def change
    create_table :week_days do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
