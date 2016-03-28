class Product < ActiveRecord::Base
	belongs_to :company
    has_many :product_categories
    has_many :images, as: :imageable

    enum status: [:disabled, :enabled, :discontinued]

end
