class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true  

  has_attached_file :profile_image, 
	                    :styles => {:original => "300x300>"}, 
	                    :default_url => "/images/profile_image/default.png"

  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/

  has_many :galleries       
end
