class Image < ActiveRecord::Base
	  belongs_to :imageable, polymorphic: true
	  has_attached_file :attachment, {
	    :styles => {
	      :medium => ["654x500>", :jpg],
	      :thumb =>["200x200#", :jpg]
	    },
	    :convert_options => {
	      :medium => "-quality 80 -interlace Plane",
	      :thumb => "-quality 80 -interlace Plane"
	      }
	    }


	  validates_attachment :image,
	    :presence => true, 
	    :size => { :in => 0..150.kilobytes },
	    :content_type => { :content_type => /^image\/(jpeg|png|gif)$/ }, if: lambda{|image| image.image_file_name_changed? or image.image_content_type_changed? or image.image_file_size_changed?}

	  enum sub_type: [:original, :additional, :display, :flip, :disabled, :desktop, :mobilesite]

end


