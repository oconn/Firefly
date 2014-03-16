class Post < ActiveRecord::Base
  validates :title, :description, :body, :photographer_id, presence: true
  
  has_attached_file :cover_image, 
	                    :styles => {:original => "600x350>"}, 
	                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/
  
	belongs_to :photographer
	has_many :comments
	has_one :visit, :as => :visitable
	has_and_belongs_to_many :tags
end
