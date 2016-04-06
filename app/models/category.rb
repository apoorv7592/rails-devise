# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  status      :integer
#  parent_id   :integer
#  url_string  :string
#  seo_title   :string
#  seo_meta    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :images, as: :imageable
  belongs_to :category, :foreign_key => :parent_id
  has_many :categories, :foreign_key => :parent_id

  enum status: [:disabled, :enabled, :discontinued]


    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        service = Category.new
  	    service.name = row[1]
  	    service.parent_id = row[2]
  	    service.status = "enabled"
  	    service.save
      end
    end

end
