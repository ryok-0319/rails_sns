class CreateFavToTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :fav_to_tweets do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true

      t.timestamps
    end
  end
end
