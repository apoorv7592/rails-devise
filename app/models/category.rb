class Category < ActiveRecord::Base
  attr_accessor :image
  has_many :product_categories
  has_many :products, through: :product_categories
  has_one :image, as: :imageable

  enum status: [:disabled, :enabled, :discontinued]

  after_create :image_upload #if: lambda { |fanbook| fanbook.upload.present? }
  
  
  def image_upload
    image_params = {"imageable_id": self.id, "imageable_type": "Category", "image": image}
    Image.create(image_params)
  end
end
