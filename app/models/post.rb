class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :description, :body, :photographer_id, presence: true
  
  has_attached_file :cover_image, 
	                    :styles => {:original => "900x400>"}, 
	                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/
  validates :cover_image, attachment_presence: true
  
	belongs_to :photographer
	has_many :comments
	has_one :visit, :as => :visitable
	has_and_belongs_to_many :tags
end
