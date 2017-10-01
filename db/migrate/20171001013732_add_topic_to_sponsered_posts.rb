class AddTopicToSponseredPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :sponsered_posts, :topic_id, :integer
    add_index :sponsered_posts, :topic_id
  end
end
