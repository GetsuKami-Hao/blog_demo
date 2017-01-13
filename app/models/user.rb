class User < ApplicationRecord

	has_many :articles

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
																	default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/								

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
