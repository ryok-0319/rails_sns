class CreateReplyFavs < ActiveRecord::Migration[5.1]
  def change
    create_table :reply_favs do |t|
      t.references :user, null:false
      t.references :reply, null:false
      t.timestamps
    end
  end
end
