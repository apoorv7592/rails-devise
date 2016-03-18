class Category < ActiveRecord::Base
  
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :images, as: :imageable

  enum status: [:disabled, :enabled, :discontinued]
end
