class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :zip_code, null: false

      t.timestamps null: false
    end
  end
end
