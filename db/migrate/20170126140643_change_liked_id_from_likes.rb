class ChangeLikedIdFromLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :liked_comment_id , :integer

    add_index :likes , :liked_comment_id
    add_index :likes , [:liker_id, :liked_comment_id], unique: true
  end
end
