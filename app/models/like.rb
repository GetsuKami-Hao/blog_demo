class Like < ApplicationRecord
	belongs_to :liker, class_name: "User"
	belongs_to :liked_article, class_name: "Article"
	#liked_article must exit.

	# ---  以后寻求解决办法 ---
	# belongs_to :liked_comment, class_name: "Comment"
	validates :liker_id, presence: true
	validates :liker_id, uniqueness: { scope: :liked_article_id}
end
