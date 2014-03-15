class Tag < ActiveRecord::Base

	has_and_belongs_to_many :posts

	validates :name, presence: true

	before_save :format_tag_name

	private

	def format_tag_name
    self.name = self.name.downcase
	end
end
