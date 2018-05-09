class AddColumnToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :favs_count, :integer
  end
end
