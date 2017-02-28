class RenameLikedIdFromLikes < ActiveRecord::Migration[5.0]
  def change
  	rename_column :likes, :liked_id, :liked_article_id
  	add_index :likes , [:liker_id, :liked_article_id], unique: true
  end
end
