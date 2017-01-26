
class User < ApplicationRecord

	has_many :articles, dependent: :destroy
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


	validates :name, presence: true, length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false } 
	
	before_save :downcase_email

	has_secure_password
	validates :password, presence: true, length: { in: 6..20 } , allow_nil: true	

	#　from https://github.com/thoughtbot/paperclip
	has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, 
																default_url: "/system/default/thumb/example.jpeg"	
																	# default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/								

  def like(article)
  	
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
