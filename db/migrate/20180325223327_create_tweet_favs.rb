class CreateTweetFavs < ActiveRecord::Migration[5.1]
  def change
    create_table :tweet_favs do |t|
      t.references :user, null:false
      t.references :tweet, null:false
      t.timestamps
    end
  end
end
