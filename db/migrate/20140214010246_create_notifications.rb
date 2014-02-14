class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :click_action
      t.string :status

      t.timestamps
    end
  end
end
