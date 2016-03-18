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
	      }
	    }


	  validates_attachment :image,
	    :presence => true, 
	    :size => { :in => 0..1500.kilobytes },
	    :content_type => { :content_type => /^image\/(jpeg|png|gif)$/ } # if: lambda{|image| image.image_file_name_changed? or image.image_content_type_changed? or image.image_file_size_changed?}

	  enum sub_type: [:original, :additional, :display, :flip, :disabled, :desktop, :mobilesite]

end


