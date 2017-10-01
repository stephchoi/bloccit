class CreateSponseredPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsered_posts do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
