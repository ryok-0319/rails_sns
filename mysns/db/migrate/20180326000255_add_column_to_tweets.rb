class AddColumnToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :favs_count, :integer
  end
end
