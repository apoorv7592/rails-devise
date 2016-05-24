class Home < ActiveRecord::Base
    has_many :images, as: :imageable
	 
	attr_accessor :image
    after_save :image_upload
	enum classified_as: [:banner, :offer]

	def image_upload
	  image.each { |pic| self.images.create(image: pic) } if image.present?
	end

end
