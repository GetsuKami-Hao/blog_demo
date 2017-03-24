class Like < ApplicationRecord

  belongs_to :liker, class_name: "User"

  #liked_article must exit.
  # ---  以后寻求解决办法 ---
  belongs_to :liked_article, class_name: "Article"

  # belongs_to :liked_comment, class_name: "Comment"
  
  validates :liker_id, presence: true
  validates :liker_id, uniqueness: { scope: :liked_article_id, message: "唯一"}
  # message: 'liker and liked_article unique'
end
