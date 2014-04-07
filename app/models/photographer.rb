class Photographer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, and :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :first_name, :last_name, presence: true  

  has_many :posts
  has_one :portfolio

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
 