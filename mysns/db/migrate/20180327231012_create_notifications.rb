class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, null:false
      t.references :notified_by, null:false
      t.integer :type, null:false
      t.boolean :read, default:false
      t.text :message
      t.text :link

      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :user_id
    add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
