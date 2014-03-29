class Photographer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, and :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :first_name, :last_name, presence: true  

  has_attached_file :profile_image, 
	                    :styles => {:original => "300x300>"}, 
	                    :default_url => "/images/profile_image/default.png"

  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/       
  
  has_many :posts
  has_one :calendar
end
 