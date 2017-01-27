class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

  has_many :passive_likes, class_name:  "Like",
                           foreign_key: "liked_article_id",
                           dependent:   :destroy
	has_many :liked_article, through: :passive_likes                           

	# has_many :followers, through: :passive_relationships, source: :follower

end
