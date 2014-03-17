class Gallery < ActiveRecord::Base
	has_attached_file :cover_image, 
	                    :styles => {:original => "400x300#"}, 
	                    :default_url => "/images/:style/missing.png"
  
  validates :cover_image, attachment_presence: true
  
  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/
  validates :name, :user_id, :photographer_id, presence: true

  belongs_to :user
  has_many :images, dependent: :destroy
end
