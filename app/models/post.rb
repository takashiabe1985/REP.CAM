class Post < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 255 }
  
  has_many :posts
end
