class CreateFavToReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :fav_to_replies do |t|
      t.references :user, foreign_key: true
      t.references :reply, foreign_key: true

      t.timestamps
    end
  end
end
