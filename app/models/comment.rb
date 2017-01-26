class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :likes, dependent: :destroy

  validates :user_id, presence: true
  validates :article_id, presence: true

end
