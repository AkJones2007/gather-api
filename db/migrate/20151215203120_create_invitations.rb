class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
