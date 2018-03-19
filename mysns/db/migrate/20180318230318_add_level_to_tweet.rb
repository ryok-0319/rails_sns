class AddLevelToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :level, :int
  end
end
