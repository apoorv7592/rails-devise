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

FactoryGirl.define do
  factory :image do
    
  end
end
