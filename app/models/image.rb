# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  imageable_id       :integer
#  imageable_type     :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  alt_tag            :string
#  details            :text
#  priority           :integer
#  sub_type           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Image < ActiveRecord::Base
	  belongs_to :imageable, polymorphic: true
	  has_attached_file :image, {
	    :styles => {
		    thumb: '100x100>',
		    square: '200x200#',
		    medium: '340x340>',
		    large:  '500x500>'
	    },
	    :convert_options => {
	      :medium => "-quality 80 -interlace Plane",
	      :thumb => "-quality 80 -interlace Plane",
	      :square => "-quality 80 -interlace Plane",
	      :large => "-quality 80 -interlace Plane"
	    },
        :path =>  "/products/:id/:style/:filename",
	    storage: :s3,
                  s3_credentials: {access_key_id: ENV["AWS_ACCESS_KEY_ID"], secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]},
                  bucket: ENV["AWS_BUCKET"]
        }


	  validates_attachment :image,
	    :presence => true, 
	    :size => { :in => 0..1500.kilobytes },
	    :content_type => { :content_type => /^image\/(jpeg|png|gif)$/ }   


end


