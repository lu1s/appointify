class CreateCalendarRanges < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_ranges do |t|
      t.references :week_day, foreign_key: true
      t.references :calendar, foreign_key: true
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
