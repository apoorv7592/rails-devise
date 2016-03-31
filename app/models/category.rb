class Category < ActiveRecord::Base
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :images, as: :imageable
  belongs_to :category, :foreign_key => :parent_id
  has_many :categories, :foreign_key => :parent_id

  enum status: [:disabled, :enabled, :discontinued]

end
