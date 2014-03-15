class Comment < ActiveRecord::Base
  
  validates :name, :body, presence: true
  validates :body, length: { maximum: 3000, too_long: "%{count} characters is the maximum allowed" }

  belongs_to :post
end
