class Like < ApplicationRecord
	belongs_to :liker, class_name: "User"
	belongs_to :liked_article, class_name: "Article"
end
