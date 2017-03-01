class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :user_id, presence: true
  validates :article_id, presence: true

  has_many :passive_likes, class_name:  "Like",
                           foreign_key: "liked_comment_id",
                           dependent:   :destroy

  has_many :liked_comment, through: :passive_likes    

end
