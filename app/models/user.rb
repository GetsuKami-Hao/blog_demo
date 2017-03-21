
class User < ApplicationRecord

  has_many :articles, dependent: :destroy
	
  validates_associated :articles 
  #保存对象时，会在关联的每个对象上调用valid?方法
  has_many :active_relationships, class_name: "Relationship",
																	foreign_key: "follower_id",
																	dependent: :destroy


  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
	
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :comments , dependent: :destroy

  has_many :active_likes, class_name:  "Like",
                          foreign_key: "liker_id",
                          dependent:   :destroy

  has_many :liker, through: :active_likes

  validates :name, presence: true, length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
									format: { with: VALID_EMAIL_REGEX },
									uniqueness: { case_sensitive: false } 
	

  before_save :downcase_email

  has_secure_password

  validates :password, presence: true, length: { in: 6..20 } , 
							allow_nil: true	


  #　from https://github.com/thoughtbot/paperclip

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, 
																default_url: "/system/default/thumb/example.jpeg"	
																	# default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/								

  def like_article(article)
    active_likes.create(liked_article_id: article.id)
  end

  def unlike_article(article)
    active_likes.find_by(liked_article_id: article.id).destroy
  end

  def like_article?(article)
    !!active_likes.find_by(liked_article_id: article.id)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost

      BCrypt::Password.create(string, cost: cost)
    end
  end

  private
  #　邮件存入数据库之前小写。

  def downcase_email
    self.email = email.downcase
  end
end
