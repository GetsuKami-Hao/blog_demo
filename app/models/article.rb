class Article < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :passive_likes, class_name:  "Like",
                           foreign_key: "liked_article_id",
                           dependent:   :destroy

  has_many :liked_article, through: :passive_likes                           

  # has_many :followers, through: :passive_relationships, source: :follower

  validates_associated :comments
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true


  def to_param
    "#{id} #{title}".parameterize
  end

end
