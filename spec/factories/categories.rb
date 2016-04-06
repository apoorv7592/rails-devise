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

FactoryGirl.define do
  factory :category do
    name "MyString"
    description "MyString"
    status 1
    url_string "MyString"
    seo_title "MyString"
    seo_meta "MyString"
  end
end
