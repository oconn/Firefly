class Post < ActiveRecord::Base
  
  validates :title, :description, :body, :photographer_id, presence: true

	belongs_to :photographer
	has_many :comments
end
