class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string "title"
      t.string "description"
      t.datetime "date_time"
      t.timestamps
    end
  end
end
