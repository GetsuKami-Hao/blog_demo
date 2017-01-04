class Article < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

end
