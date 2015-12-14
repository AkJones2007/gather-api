class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.string :title, null: false
      t.string :location, null: false
      t.date :date, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
