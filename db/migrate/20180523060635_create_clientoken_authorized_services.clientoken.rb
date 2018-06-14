# This migration comes from clientoken (originally 20180418102003)
class CreateClientokenAuthorizedServices < ActiveRecord::Migration[5.1]
  def change
    create_table :clientoken_authorized_services do |t|
      t.string :application_name,      :null => false
      t.string :old_application_token, :null => false
      t.datetime :valid_until,         :null => false
      t.string :application_token,     :null => false

      t.timestamps
    end
    add_index :clientoken_authorized_services, :application_name, unique: true
    add_index :clientoken_authorized_services, :application_token, unique: true
  end
end
