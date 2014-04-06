class PortfolioImage < ActiveRecord::Base
  has_attached_file :image_path, 
	                    :styles => {:thumb => "200x200#",
	                    	          :large => "900x900>"}, 
	                    :default_url => "/images/:style/missing.png"
  
  validates :image_path, attachment_presence: true
  
  validates_attachment_content_type :image_path, :content_type => /\Aimage\/.*\Z/
end