# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  url              :string(100)
#  meta_title       :string
#  meta_description :text
#  meta_keywords    :text
#  company_id       :integer
#  rank             :integer
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Product < ActiveRecord::Base
	belongs_to :company
    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many :images, as: :imageable
    has_many :product_sizes

    enum status: [:disabled, :enabled, :discontinued]
    validates_presence_of :name, :company_id,   :message => "can't be empty"
    attr_accessor :image, :sizes, :product_categories
    after_save :image_upload, :product_sizes_add, :product_categories_add

  searchable do
    text :name

    text :description, :stored => true
    integer :id, :stored => true

    string :url, :stored => true
    integer :rank, :stored => true
    
    text :product_sizes, :stored =>true do
      product_sizes.enabled.map { |product_size| [product_size.id, product_size.size, product_size.qty_avail, product_size.mrp, product_size.price].join('|') }
    end
    

    text :images, :stored =>true do
      images.map { |image| [image.image_file_name].join('|') }
    end
  end


	def image_upload
	  image.each { |pic| self.images.create(image: pic) } if image.present?
	end

  def product_sizes_add
    unit = sizes[0]["size_unit"]["unit"]
    sizes.map { |size| ProductSize.create(product_id:self.id,size:size["size"],size_unit:unit,qty_avail:size["qty_avail"],mrp:size["mrp"],price:size["price"],weight:size["weight"],status:size["status"]) }  if sizes.present?
  end

  def product_categories_add
    product_categories.map { |pc| ProductCategory.create(product_id:self.id,category_id: pc) } if product_categories.present?
  end
end
