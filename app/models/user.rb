class User < ApplicationRecord
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

	private
		#　邮件存入数据库之前小写。
		def downcase_email
			self.email = email.downcase
		end
end
