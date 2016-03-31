class Product < ActiveRecord::Base
	belongs_to :company
    has_many :product_categories
    has_many :images, as: :imageable
    has_many :product_sizes

    enum status: [:disabled, :enabled, :discontinued]

    attr_accessor :image
    after_create :image_upload  
  
	def image_upload
	  image.each { |pic| self.images.create(image: pic) }
	end
end
